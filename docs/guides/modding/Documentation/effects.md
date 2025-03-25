# CK3 Effects

An effect is a script command that changes the gamestate.

The full list of available code effects can be found in effects.log.

## Contents

1.  [Effect blocks](#effect-blocks)
2.  [Effect syntax](#effect-syntax)
    - [Code effects](#code-effects)
      - [Boolean form](#boolean-form)
      - [Simple form](#simple-form)
      - [Complex form](#complex-form)
3.  [scripted_effects](#scripted_effects)
    - [Simple form](#simple-form-1)
    - [Complex form](#complex-form-1)
4.  [Conditional effects](#conditional-effects)
5.  [Control effects](#control-effects)
6.  [Dump Export](#dump-export)

## Effect blocks

Effects are executed in effect script blocks.

Those are either explicitly named so, like a decision's `effect = { }` block, or their name alludes to when the effect block is executed, like an event's `immediate = { }` block which is immediately executed when the event fires, even before the event window opens, by opposition to the event's `after = { }` block, which is executed after any event option has been picked.

Some effect blocks are executed when something else happens, like a character interaction's `on_accept` block, and must not be confused with on_actions.

In some cases, effects are used in hybrid blocks that accept effects amongst other things. Ex: event options

```
option = {
   is_shown = { is_ai = yes }
   ai_will_do = { base = 100 }
   add_gold = 100
}
```

In this block, `add_gold` is the effect executed when the option is picked, but `is_shown = { }` is a trigger block and `ai_will_do` is an aI logic block.

## Effect syntax

### Code effects

Code effects have a predetermined syntax. They usually require a specific scope type context to work.

The console command `script_docs` dumps the effects.log, which contains the list of all existing code triggers, in `Documents\Paradox Interactive\Crusader Kings III\logs`.

Code effects can take several forms:

#### Boolean form

Boolean effects are followed by `= yes`. The effect usually depends on the scope it is executed from, but otherwise it does not require any argument.

Ex: this effect releases the current character scope from prison.

```
release_from_prison = yes
```

#### Simple form

Simple effects require a single argument, provided on the right hand side of the `=` sign.

The argument can be:

- a scope

  Ex: this effect makes the target scope the spouse of the current character scope

  ```
  marry = scope:bride
  ```

- a database key

  Ex: this effect changes the prison type of the current character scope

  ```
  change_prison_type = house_arrest
  ```

- a numerical value

  Ex: this effect adds the specified amount of gold to the current character scope

  ```
  add_gold = 1000
  ```

#### Complex form

Complex effects use several parameters in a script block. Those parameters can be a boolean, a scope, a database key, a numerical value or a flag value.

Ex: this effects makes the target character, provided as a saved scope, a prisoner of the current character scope, and places them in house arrest.

```
imprison= {
  target = scope:imprisoned_character
  type = house_arrest
}
```

Some code effects have both a simple form and a complex form.

## scripted_effects

Scripted_effects are macros that enable replacing an assortment of effects with a single statement, to make script more legible and avoid repetition.

They are defined in `common/scripted_effects`, and can be used anywhere effects are allowed.

A scripted_effect can use other scripted_effects, but recursion is not allowed.

### Simple form

Simple scripted_effects execute a predetermined set of effects.

Ex: if the following set of effects are repeatedly used to give a character gold, prestige and piety:

```
add_gold = 1000
add_prestige = 1000
add_piety = 1000
```

instead of repeating the same set of triggers in different places, they can be defined as a scripted_effect:

```
give_gold_prestige_piety = {
   add_gold = 1000
   add_prestige = 1000
   add_piety = 1000
}
```

and anywhere that set of effects needs to be executed, it can be replaced by the following statement:

```
give_gold_prestige_piety = yes
```

Because scripted_effects can be used in a variety of different contexts, it is advised not to use in their definition ambiguous event targets such as `root` or `prev`.

### Complex form

Scripted_effects can also have a complex form that handles literal text replacement, allowing to pass arguments.

Ex: if the following set of effects are repeatedly used to give a character gold, prestige and piety:

```
add_gold = 1000
add_prestige = 1000
add_piety = 1000
```

that set of triggers can be defined as a scripted_effect, but instead of using a specific value for those effects, the scripted_effect uses an argument defined in uppercase letters wrapped in two `$` signs:

```
give_gold_prestige_piety = {
   add_gold = $VALUE$
   add_prestige = $VALUE$
   add_piety = $VALUE$
}
```

When used, the complex form of the scripted_effect specifies what the expected argument is, by using the same name but without the `$` signs:

```
give_gold_prestige_piety = { VALUE = 1000 }
```

With that form, every occurrence of `$VALUE$` in the scripted_effect will be literally replaced with the argument provided: the text replacement happens before the scripted_trigger is evaluated. For this reason, caution is advised when using scripted_effect arguments to pass event targets or script_values, because their interpretation is contextual.

Ex: consider the following scripted_effect that makes a character give gold to another character:

```
give_gold = {
   $GIVER$ = {
      remove_short_term_gold = $VALUE$
      $TAKER$ = {
         add_gold = $VALUE$
      }
   }
}
```

If used like so from a character scope to make the father give money to the mother:

```
give_gold = {
   GIVER = father
   TAKER = mother
   VALUE = 1000
}
```

Text replacement being literal means that the scripted_effect will be interpreted as such:

```
give_gold = {
   father = {
      remove_short_term_gold = 1000
      mother = {
         add_gold = 1000
      }
   }
}
```

So the character receiving the money is not the intended character.

To avoid such issues, arguments in scripted_effects can be saved as scopes within the scripted_effect itself, before doing any context switch.

```
give_gold = {
   $GIVER$ = { save_scope_as = giver }
   $TAKER$ = { save_scope_as = taker }
   save_scope_value_as = {
      name = gold_amount
      value = $VALUE$
   }
   scope:giver = {
      remove_short_term_gold = scope:gold_amount
      scope:taker = {
         add_gold = scope:gold_amount
      }
   }
   clear_saved_scope = giver
   clear_saved_scope = taker
}
```
