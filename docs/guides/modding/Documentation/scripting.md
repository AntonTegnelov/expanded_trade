# CK3 Scripting

## Introduction

Scripting lets you add and change game content using Paradox's custom scripting language. It's very readable, using names like `add_gold` or `set_variable`. This guide covers the fundamentals of CK3 scripting.

Script is used in `common/` and `events/` folders, extending to decisions, interactions, activities and definitions of religions, cultures, legacies and so on.

What isn't script:

- Most of AI or army behavior is done in game code, which is inaccessible to modders (hardcoded)
- UI is a separate system, and with a few exceptions, you cannot use script in UI or UI functions in script (use Scripted GUIs to execute script in UI)
- History modding uses a slightly different static system, but allows script effects

## Basics

### Documentation

In `docs/api/` there are logs with lists of all available functions:

- **effects** - do something, like `add_gold`. Used in effect blocks, like `immediate = {}`, `effect = {}`, `on_accept = {}`
- **triggers** - check for something and return true or false, like `is_ai = yes`. Can also return values. Used in trigger blocks, like `limit = {}`, `trigger={}`
- **event targets** - select another game object, like `primary_heir` selects your heir. We call such objects "scopes" and switching between them "scoping"

### Limitations

- No access to the operating system
- One-dimensional arrays
- No string manipulation
- No in-line math
- Slower than actual game code

### Script Language

There is no official name for the language, it's just "Paradox scripting language". Some developers call it "Jomini script" after it was updated with the Jomini library of tools. "Clausewitz" is the name of the game engine.

### Testing

There are several ways to test your script:

- Run short scripts in the console by adding the word effect or trigger in front:

  ```
  effect add_gold = 100
  ```

  or

  ```
  trigger is_ai = yes
  ```

- Use script runner in the explorer (console command `explorer`)
- Place your script in a `.txt` file in the `run/` folder and execute it with `run filename.txt` console command
- Run the game with `-develop` launch option to make events/decisions reload instantly
- Launch the game with `-debug_mode` to use the console

Keep the error log open to see any issues. Run console command `release_mode` to show the error tracker in game.

## Syntax

Most script follows this structure:

```
x = y

x = { y = z }

x = {
  a = b
  e = {
    f = g
  }
}
```

Examples:

```
is_alive = yes
add_gold = 100
debug_log = "hello world"
player_heir = { marry = root }
```

Effects and triggers are never used separately, they need to be followed by another parameter, sometimes simply `= yes`.

Triggers can also be used with `= no`, to check for the opposite:
`is_ai = no` is the same as `NOT = { is_ai = yes }`

Triggers that check for a value can also return it:
`add_gold = age` would add gold equal to the character's age.

For complex triggers that have a target there is special syntax, with the target in round brackets:

```
add_gold = "opinion(liege)"
```

Yes, quotation marks are necessary here.

### Scopes

Scopes are entities in the game, like a character or county. Effects and triggers need to be used on the right scopes - e.g. `age` trigger only works on a character.

Event targets let us switch from one scope to another, we call that scoping.

- `primary_heir` is an event target, only available on a character, returning their primary heir

Scopes can be chained like this: `x.y.z`

`primary_heir.faith.religious_head` is the same as:

```
primary_heir = {
  faith = {
    religious_head = { }
  }
}
```

### Prefixes

We need to add a special prefix to directly reference a culture, faith, religion, title or character:

```
set_culture = culture:english
set_character_faith = faith:orthodox
capital_county = title:c_byzantion
marry = character:123456
```

Look for keys in the files and character IDs in the debug tooltip.

### Formatting

Script inside curly brackets is called a "code block". Indentation isn't important for execution but helps with readability. Each code block should be indented with one more tab to help see where they open and close.

Comments are made with `#` in front of text.

**Exceptions**: Some blocks accept multiple entries without a paired parameter, for example, events in on_actions:

```
on_death = {
  events = {
    death_management.0096
    death_management.0097
    death_management.0098
  }
}
```

## Keywords

**root** - the object at the root of the script, for whom the script is executing. In an event, root is the character who received the event. Anywhere in that event root will reference that character again.

Example: `primary_heir = { set_relation_grudge = root }`

**prev** - previous scope in the script

```
primary_heir = {
  primary_spouse = {
    set_relation_soulmate = prev
  }
}
```

Here the heir's spouse will become their soulmate. Note that there is no prevprev, we can only go back one time.

**this** - references current scope. Not needed most of the time, but useful in some cases:

```
county.holder = {
  OR = {
    this = root
    this = root.primary_spouse
  }
}
```

## Operators

### Logic operators

Script uses the following logic operators:

- `AND` - true if all conditions are true
- `OR` - true if any condition is true
- `NOT` - true if the condition is false
- `NOR` - true if all conditions are false
- `NAND` - true if any condition is false

They are used like this:

```
OR = {
  is_ai = yes
  gold > 100
}
```

This will return true if the character is AI OR if they have more than 100 gold.

Multiple parameters can be put in a block, and they can be nested, like `OR = { AND = { NOT = {...`.

Note that all trigger blocks, like `limit={}`, work as AND by default and accept multiple parameters.

Operators don't have to be capitalized, but it is common practice for readability.

### Relational operators

Scopes are compared with `=`. For example, `primary_heir = primary_spouse`.

`!=` means NOT equal, same as `NOT = { x = y }`

Values can be compared with `< <= = != > >=`

`?=` is a special operator that checks that this object exists and only then compares it:

```
capital_county ?= title:c_byzantion
```

This checks that the character has a capital county first. Same as:

```
exists = capital_county
capital_county = title:c_byzantion
```

## Saved scopes

A saved scope is similar to a variable. It saves an object so you can reference it later and exists only temporarily in the script where it was saved.

```
save_scope_as = name
scope:name = { # do something }
```

Example:

```
primary_heir = { save_scope_as = my_son }
scope:my_son = { death = natural }
```

The saved scope persists in other events or scripted effects called from the same script. Once the whole script ends execution, the saved scope will be gone.

`save_scope_value_as` can save a value or a string flag, referenced the same way:

```
save_scope_value_as = {
  name = cost
  value = primary_heir.age
}
add_gold = scope:cost

save_scope_value_as = {
  name = kill_locale
  value = flag:tower
}
if = {
  limit = { scope:kill_locale = flag:tower }
  # do something
}
```

In triggers, use `save_temporary_scope_as` and `save_temporary_scope_value_as`

Some saved scopes are premade by the game itself in on_actions and character interactions. For example, in an interaction, `scope:actor` is the character who started the interaction, `scope:recipient` is the target character.

**Important**: Do not use `scope:` before event targets or keywords like root and prev. `scope:` is only used with saved scopes that you or the game saved before!

## Variables

A variable is a container that can hold a value. Variables can hold numbers, characters, booleans or string flags. We don't need to declare the data type.

Example:

```
set_variable = {
  name = test
  value = 10
}
```

Get its value with `var`:

```
add_gold = var:test
marry = var:my_crush
```

A variable can be set simply with `set_variable = test`. It is the same as setting a variable with `value = yes`.

To change it, use `change_variable`, to remove, `remove_variable`:

```
change_variable = { name = test add = 1 }
```

and

```
remove_variable = test
```

Make sure to not use `var:` in these examples, simply the name of the variable!

Value field can also be expanded to do math:

```
set_variable = {
  name = test
  value = {
    add = 10
    divide = 5
    subtract = 1
  }
}
```

### Variable Types

There are different types of variables based on how they are stored:

- **normal** (`set_variable`) - stored on the scope where the effect was used
  - accessed with `var:`. Can be chained: `primary_heir.var:my_sons_birthday`
  - if stored on a character, will be lost when the character dies
- **global** (`set_global_variable`) - stored globally and accessible from anywhere
  - accessed with `global_var:`
- **local** (`set_local_variable`) - temporary variable that only exists while the script is executed
  - accessed with `local_var:`
- **dead** (`set_dead_character_variable`) - stored on a dead character, requires a duration
  - accessed with `dead_var:`, does not have a change_effect

Global and local variables have their own effects for changing and removing:
`change_global_variable`, `remove_global_variable`, `change_local_variable`, `remove_local_variable`

In UI, variables can be displayed:

- Normal: `"[GetPlayer.MakeScope.Var('test').GetValue]"`
- Global: `"[GetGlobalVariable('test').GetValue]"`

If the variable stores another character, use `GetCharacter` instead of `GetValue`.

## Statements

### if / else / else_if

Executes an effect if the `limit = {}` returns true:

```
if = {
  limit = { is_ai = no }
  add_gold = 100
}
```

This would add gold only if the character is not an AI. If the limit is false, a different effect can be executed with `else`. To add another condition, use `else_if`:

```
if = {
  limit = {
    # condition
  }
  # effect
}
# optional
else_if = {
  limit = { #condition }
  # effect
}
else = {
  # effect
}
```

Notes:

- `limit` acts like an AND block, so you can put multiple conditions without using AND
- Make sure your effect is inside the if block and outside of limit

### switch

If you have many else_ifs checking for the same trigger, it could be replaced with a switch. Switch selects one effect that matches the value of the trigger:

```
switch = {
  trigger = has_culture
  culture:english = { add_gold = 10 }
  culture:french = { add_gold = 20 }
  culture:italian = { add_gold = 30 }
}
```

### while loop

`while` repeats an action multiple times. It can use `count` to run a set amount of times or `limit` to continue until the condition returns false:

```
while = {
  count = 10
  add_gold = 100
}
```

```
while = {
  limit = { gold > 0 }
  remove_short_term_gold = 50
}
```

`while` is limited to 1000 iterations by default to avoid infinite loops.

### trigger_if / trigger_else / trigger_else_if

`trigger_if` checks a trigger only if the limit block is true. If it's false, the check is skipped:

```
trigger_if = {
   limit = { is_ai = no }
   is_independent_ruler = yes
}
```

`trigger_else_if` can be used after a `trigger_if` similar to if/else:

```
trigger_if = {
  limit = { ... }
  ...
}
trigger_else_if = {
  limit = { ... }
  ...
}
trigger_else = {}
```

Remember to only use `trigger_if` in trigger blocks, not in effect blocks!

## Lists / Arrays

Lists can hold multiple objects, variables and string flags, but not other lists. There are two types: temporary and permanent.

To make a list, add each item with one of these commands:

**Temporary:**

- `add_to_list` - simple list, only exists during script execution
- `add_to_local_variable_list` - supports adding duration for the item
- `add_to_temporary_list` - can be used in a trigger block

**Permanent:**

- `add_to_variable_list` - stored on the scope where executed, supports duration
- `add_to_global_variable_list` - global permanent list, supports duration

If a list doesn't exist yet, these commands will create it. Items won't be duplicated.

Remember to run `add_to_variable_list` on the scope that will store the list:

```
every_ruler = {
  root = {
    add_to_variable_list = {
      name = rulers
      target = prev
    }
  }
}
```

To check if an item is in a list:
`is_in_list`, `is_target_in_variable_list`, `is_target_in_global_variable_list`, `is_target_in_local_variable_list`

To remove an item:
`remove_from_list`, `remove_list_variable`, `remove_list_local_variable`, `remove_list_global_variable`

To clear variable lists:
`clear_variable_list`, `clear_global_variable_list`, `clear_local_variable_list`

You'll almost always want to run `clear_variable_list` before creating one.

## Iterators

Iterators go through a series of items and run effects or triggers for each one:

```
every_ruler = {
  limit = { age > 20 }
  add_gold = 100
}
```

This adds 100 gold to every ruler older than 20. The `limit = {}` is optional.

Be careful with nested iterators like `every_living_character = { every_province = {` as this could cause lag.

### Effect iterators

These run effects on items:

- `every_x` - runs through all items in order
- `ordered_x` - orders items by a value, like age
- `random_x` - picks one random item

### Trigger iterator

Trigger iterators work in trigger blocks:

- `any_x` - returns true if the condition is true for any item

`any_x` can use count and percent to specify how many items should return true:

```
any_living_character = {
  count > 10
  has_culture = culture:english
  is_adult = yes
}
```

This checks that there are more than 10 English adults.

Do not use `limit` inside an `any_` iterator! It is already a trigger.

### List iterators

To iterate through lists:

- `every_in_list`, `every_in_local_list`, `every_in_global_list`
- `ordered_in_list`, `ordered_in_local_list`, `ordered_in_global_list`
- `random_in_list`, `random_in_local_list`, `random_in_global_list`
- `any_in_list`, `any_in_local_list`, `any_in_global_list`

Specify which list with `list = name` or `variable = name`.

## Templates

### Scripted effects

Scripted effects are templates that avoid code duplication. They're defined in:

- `common/scripted_effects` to be used globally
- event files, just for the events there

In common/scripted_effects:

```
my_effect = { add_gold = 100 }
```

Use it in script:

```
my_effect = yes
```

In events:

```
scripted_effect convert_family = {
  every_close_family_member = {
    set_character_faith = faith:adamites
  }
}
```

Used the same way: `convert_family = yes`

### Substitution

You can define parameters in scripted effects:

```
gift = { add_gold = $val$ }
```

When used, replace the parameter:

```
gift = { val = 100 }
```

You can replace any part:

```
my_iterator = { every_$WHO$ = { add_gold = 10 } }
```

Used:

```
my_iterator = { WHO = child }
```

This becomes `every_child = { add_gold = 10 }`.

You can also insert whole chunks of script:

```
do_anything = { $DO$ }
```

```
do_anything = { DO = "add_gold = 100" }
```

Only use `$$` in the definition, not when it's used. It's common to capitalize parameters so they stand out.

### Scripted triggers

Scripted triggers work like scripted effects but for trigger blocks. They're defined in `common/scripted_triggers` or in event files.

```
my_trigger = { is_ai = yes }
```

Used: `my_trigger = yes`

You can also use `= no` to check for false: `my_trigger = no` is the same as `NOT = { my_trigger = yes }`

### Script values

Script values run calculations and return values. They're defined in `common/script_values`:

```
my_value = {
  add = age
  add = 10
  divide = 5
}
```

Used: `add_gold = my_value`

Can be displayed in UI:
`"[GetPlayer.MakeScope.ScriptValue('my_value')]"`

Script values run every time they're used, so complex calculations could cause lag, especially in UI.

## Workarounds

### Multi-dimensional arrays

You can create more complex data structures using either:

- provinces (9000 of them, no setup required)
- story cycles (can execute effects automatically, more robust but requires setup)

Basic process:

1. Add a container to a variable list
2. Set variables to that container
3. Use the list and reference the variables in each item
