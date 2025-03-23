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

- [ ] Audit county flag usage
  - [x] Ensure `on_silk_road`, `on_active_trade_route`, and `on_disrupted_trade_route` flags are set before checking
  - [x] Add safety checks before using flags in conditions
  - [ ] Replace custom county flag `coastal_county` with CK3's native coastal check if available

### 5. Script Value Definitions

- [ ] Review `common/script_values/trade_values.txt`
  - [ ] Fix `trade_node_base_value` script value definition
  - [ ] Ensure all referenced conditions and variables exist
  - [ ] Add fallback values to prevent null references

### 6. Version Compatibility

- [ ] Verify mod syntax against CK3 version 1.15.\*
  - [ ] Check for deprecated functions or syntax
  - [ ] Replace with current equivalents if needed

## 7. Implement Comprehensive Debug Logging

### 7.1 Trade Route Files

- [ ] Add debug_log statements to `common/trade_routes/silk_road_main.txt`
  - [ ] Log route initialization: `debug_log = "Silk Road route initialized"`
  - [ ] Log each node connection: `debug_log = "Connected node: [From.GetID] to [To.GetID]"`
  - [ ] Log route status changes: `debug_log = "Route status change: [RouteID] is now [Status]"`

### 7.2 Trade Node Files

- [ ] Add debug_log statements to `common/trade_nodes/silk_road_nodes.txt`
  - [ ] Log node initialization: `debug_log = "Initializing node: [NodeID] at county [CountyID]"`
  - [ ] Log controller assignment: `debug_log = "Node controller set: [Character.GetID]"`
  - [ ] Log node value calculations: `debug_log = "Node value calculated: [NodeID] = [Value]"`

### 7.3 Scripted Effects

- [ ] Add debug_log statements to `common/scripted_effects/trade_effects.txt`

  - [ ] Log effect entry points: `debug_log = "Starting effect: [EffectName]"`
  - [ ] Log key variable changes: `debug_log = "Variable [VarName] changed to [Value]"`
  - [ ] Log effect completion: `debug_log = "Completed effect: [EffectName]"`

- [ ] Add debug_log statements to `common/scripted_effects/trade_calculation_effects.txt`

  - [ ] Log calculation starts: `debug_log = "Starting trade calculation for [ScopeInfo]"`
  - [ ] Log intermediate results: `debug_log = "Intermediate calculation: [StepName] = [Value]"`
  - [ ] Log final results: `debug_log = "Final trade value: [Value]"`

- [ ] Add debug_log statements to `common/scripted_effects/trade_route_effects.txt`
  - [ ] Log route effect triggers: `debug_log = "Route effect triggered: [EffectName]"`
  - [ ] Log scope changes: `debug_log = "Changing scope from [OldScope] to [NewScope]"`
  - [ ] Log route modifications: `debug_log = "Route modified: [RouteID] [ChangeType]"`

### 7.4 Script Values

- [ ] Add debug_log statements to `common/script_values/trade_values.txt`

  - [ ] Log value calculation entry: `debug_log = "Calculating script value: [ValueName]"`
  - [ ] Log conditional branches: `debug_log = "Taking condition branch: [ConditionDesc]"`
  - [ ] Log final values: `debug_log = "Final value: [ValueName] = [Result]"`

- [ ] Add debug_log statements to `common/script_values/trade_variables.txt`
  - [ ] Log variable initialization: `debug_log = "Initializing variable: [VarName] = [Value]"`
  - [ ] Log variable changes: `debug_log = "Variable changed: [VarName] from [OldValue] to [NewValue]"`

### 7.5 Scripted Triggers

- [ ] Add debug_log statements to `common/scripted_triggers/trade_triggers.txt`
  - [ ] Add debug_tooltip to key triggers: `debug_tooltip = yes`
  - [ ] Log trigger evaluation: `debug_log = "Evaluating trigger: [TriggerName] for [ScopeInfo]"`
  - [ ] Log trigger results: `debug_log = "Trigger result: [TriggerName] = [Result]"`

### 7.6 On-Actions

- [ ] Add debug_log statements to `common/on_action/trade_on_actions.txt`
  - [ ] Log on-action firing: `debug_log = "On-action fired: [OnActionName]"`
  - [ ] Log event chains: `debug_log = "Starting event chain from on-action: [EventID]"`
  - [ ] Log effect execution: `debug_log = "Executing effect from on-action: [EffectName]"`

### 7.7 Events

- [ ] Add debug_log statements to `events/trade/trade_monthly_events.txt`

  - [ ] Log event triggers: `debug_log = "Event triggered: [EventID]"`
  - [ ] Log immediate block execution: `debug_log = "Processing immediate block for event: [EventID]"`
  - [ ] Log option selection: `debug_log = "Selected option: [OptionID] for event [EventID]"`

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
