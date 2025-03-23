# Expanded Trade Mod - Stabilization TODO List

## Critical Issues to Fix

### 1. County ID References

- [x] Verify all county IDs in `common/trade_nodes/silk_road_nodes.txt`
  - [x] Replace placeholder IDs (256, 257, 258, etc.) with actual county IDs from CK3
  - [x] Confirm that all referenced counties exist in the base game

### 2. Event Implementation

- [x] Check all event references in `common/on_action/trade_on_actions.txt`
  - [x] Ensure `silk_road_events.0003` and other referenced events exist
  - [x] Validate event syntax and structure
  - [x] Fix any missing or improperly formatted events

### 3. Scope and Variable Issues

- [x] Verify custom scopes used throughout the mod
  - [x] Check if `every_trade_route` and `every_trade_node` are declared correctly
- [x] Ensure all variables are properly declared before use
  - [x] Verify variable operations (add, multiply, etc.) are valid

### 4. Flag Management

- [x] Audit county flag usage
  - [x] Ensure `on_silk_road`, `on_active_trade_route`, and `on_disrupted_trade_route` flags are set before checking
  - [x] Add safety checks before using flags in conditions
  - [x] Replace custom county flag `coastal_county` with CK3's native coastal check if available
    - Note: No custom `coastal_county` flag found in the codebase, we already use CK3's native `is_coastal_county` trigger

### 5. Script Value Definitions

- [x] Review `common/script_values/trade_values.txt`
  - [x] Fix `trade_node_base_value` script value definition
  - [x] Ensure all referenced conditions and variables exist
  - [x] Add fallback values to prevent null references

### 6. Localization Verification

- [x] Verify all localization keys in `localization/english/trade_l_english.yml`
  - [x] Check for missing localization keys
  - [x] Ensure all event text has proper localization
  - [x] Validate trade node and route name localizations

## 7. Implement Comprehensive Debug Logging

### 7.1 Trade Route Files

- [x] Add debug_log statements to `common/trade_routes/silk_road_main.txt`
  - [x] Log route initialization: `debug_log = "Silk Road route initialized"`
  - [x] Log each node connection: `debug_log = "Connected node: [From.GetID] to [To.GetID]"`
  - [x] Log route status changes: `debug_log = "Route status change: [RouteID] is now [Status]"`

### 7.2 Trade Node Files

- [x] Add debug_log statements to `common/trade_nodes/silk_road_nodes.txt`
  - [x] Log node initialization: `debug_log = "Initializing node: [NodeID] at county [CountyID]"`
  - [x] Log controller assignment: `debug_log = "Node controller set: [Character.GetID]"`
  - [x] Log node value calculations: `debug_log = "Node value calculated: [NodeID] = [Value]"`

### 7.3 Scripted Effects

- [x] Add debug_log statements to `common/scripted_effects/trade_effects.txt`

  - [x] Log effect entry points: `debug_log = "Starting effect: [EffectName]"`
  - [x] Log key variable changes: `debug_log = "Variable [VarName] changed to [Value]"`
  - [x] Log effect completion: `debug_log = "Completed effect: [EffectName]"`

- [x] Add debug_log statements to `common/scripted_effects/trade_calculation_effects.txt`

  - [x] Log calculation starts: `debug_log = "Starting trade calculation for [ScopeInfo]"`
  - [x] Log intermediate results: `debug_log = "Intermediate calculation: [StepName] = [Value]"`
  - [x] Log final results: `debug_log = "Final trade value: [Value]"`

- [x] Add debug_log statements to `common/scripted_effects/trade_route_effects.txt`
  - [x] Log route effect triggers: `debug_log = "Route effect triggered: [EffectName]"`
  - [x] Log scope changes: `debug_log = "Changing scope from [OldScope] to [NewScope]"`
  - [x] Log route modifications: `debug_log = "Route modified: [RouteID] [ChangeType]"`

### 7.4 Script Values

- [x] Add debug_log statements to `common/script_values/trade_values.txt`

  - [x] Log value calculation entry: `debug_log = "Calculating script value: [ValueName]"`
  - [x] Log conditional branches: `debug_log = "Taking condition branch: [ConditionDesc]"`
  - [x] Log final values: `debug_log = "Final value: [ValueName] = [Result]"`

- [x] Add debug_log statements to `common/script_values/trade_variables.txt`
  - [x] Log variable initialization: `debug_log = "Initializing variable: [VarName] = [Value]"`
  - [x] Log variable changes: `debug_log = "Variable changed: [VarName] from [OldValue] to [NewValue]"`

### 7.5 Scripted Triggers

- [x] Add debug_log statements to `common/scripted_triggers/trade_triggers.txt`
  - [x] Add debug_tooltip to key triggers: `debug_tooltip = yes`
  - [x] Log trigger evaluation: `debug_log = "Evaluating trigger: [TriggerName] for [ScopeInfo]"`
  - [x] Log trigger results: `debug_log = "Trigger result: [TriggerName] = [Result]"`

### 7.6 On-Actions

- [x] Add debug_log statements to `common/on_action/trade_on_actions.txt`
  - [x] Log on-action firing: `debug_log = "On-action fired: [OnActionName]"`
  - [x] Log event chains: `debug_log = "Starting event chain from on-action: [EventID]"`
  - [x] Log effect execution: `debug_log = "Executing effect from on-action: [EffectName]"`

### 7.7 Events

- [x] Add debug_log statements to `events/trade/trade_monthly_events.txt`

  - [x] Log event triggers: `debug_log = "Event triggered: [EventID]"`
  - [x] Log immediate block execution: `debug_log = "Processing immediate block for event: [EventID]"`
  - [x] Log option selection: `debug_log = "Selected option: [OptionID] for event [EventID]"`

- [ ] Add debug_log statements to `events/trade/silk_road_events.txt`

  - [ ] Log event scopes: `debug_log = "Event scope: [EventID] - Root=[Root.GetID]"`
  - [ ] Log random selections: `debug_log = "Random selection made: [ChoiceDescription]"`
  - [ ] Log event effects: `debug_log = "Applied effect: [EffectDesc] in event [EventID]"`

- [ ] Add debug_log statements to all other event files
  - [ ] Follow the same pattern of logging triggers, scopes, and effects

### 7.8 Trade Goods

- [ ] Add debug_log statements to `common/trade_goods/trade_goods.txt`
  - [ ] Log good initialization: `debug_log = "Initializing trade good: [GoodID]"`
  - [ ] Log production rules: `debug_log = "Production rule for [GoodID]: [RuleDesc]"`
  - [ ] Log good value changes: `debug_log = "Trade good value change: [GoodID] = [Value]"`
