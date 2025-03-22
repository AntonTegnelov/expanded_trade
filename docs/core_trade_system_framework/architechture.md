# Expanded Trade Mod - Technical Architecture

## 1. Overall Architecture

The Expanded Trade mod follows a modular architecture with several interconnected systems that enhance CK3's economic gameplay. The architecture is designed to integrate with existing game mechanics while providing new trade-focused features.

```
Expanded Trade Mod
│
├── Core Systems
│   ├── Trade Network System
│   ├── Trade Goods System
│   ├── Trade Flow System
│   ├── Trade Prosperity System
│   ├── Cultural Exchange System
│   ├── Merchant Organization System
│   ├── Religious Trade System
│   ├── River Trade System
│   ├── Maritime Innovation System
│   ├── Trade Technology System
│   ├── Empire Peace Effects System
│
├── Player Interaction Systems
│   ├── Trade Buildings System
│   ├── Character Interaction System
│   ├── Trade Policy System
│   ├── Caravan Events System
│   ├── Trade Fair System
│   ├── Interface System
│   ├── Lifestyle System
│   ├── Merchant Republic System
│   └── Explorer Mechanics System
│
├── Integration Systems
│   ├── Royal Court Integration
│   ├── Vassal Contract Integration
│   ├── Northern Lords Integration
│   └── Regional Trade Networks
│
└── Utility Systems
    ├── Script Values
    ├── Scripted Effects
    ├── Scripted Triggers
    └── On Actions
```

## 2. Core Systems

### 2.1 Trade Network System

**Files**: `common/trade_routes/`, `common/trade_nodes/`

- **Implementation**: Creates a network of trade nodes connected by routes
- **Data Structure**:

  ```
  trade_route = {
      id = "silk_road_main"
      name = "silk_road_name"
      nodes = { node_id_1 node_id_2 node_id_3 ... }
      land_routes = { { from = node_id_1 to = node_id_2 } ... }
      sea_routes = { { from = node_id_2 to = node_id_3 } ... }
  }

  trade_node = {
      id = "constantinople_node"
      province = province_id
      controller = scope:character # Dynamic
      value = value_calculation # Script value
  }
  ```

- **Integration Points**:
  - County system: nodes are tied to specific counties
  - Travel system: leverages existing travel_plan scope and path functionality
  - War system: route disruption based on occupation
  - Custom localization: uses existing trade_routes localization entries

### 2.2 Trade Goods System

**Files**: `common/trade_goods/`, `common/scripted_effects/trade_goods_effects.txt`

- **Implementation**: Defines tradable commodities and their production/consumption
- **Data Structure**:
  ```
  trade_good = {
      id = "silk"
      category = "luxury"
      base_value = 2.5
      production_terrain = { desert_mountains steppe }
      production_modifiers = { has_building_X development_level }
      consumption_desire = {
          court_grandeur_modifier = 0.2
          lifestyle_focus = { focus = mercantile_focus value = 0.1 }
      }
  }
  ```
- **Integration Points**:
  - County terrain system
  - Development system
  - Building system
  - Uses existing localization for luxury goods like "silk" and "spiced_wine"

### 2.3 Trade Flow System

**Files**: `common/scripted_effects/trade_calculation_effects.txt`

- **Implementation**: Calculates good movement along routes
- **Key Functions**:
  - `calculate_trade_flow_effect` - Calculates flow between nodes
  - `apply_trade_flow_modifiers` - Applies resulting modifiers
  - `check_trade_flow_disruption_trigger` - Determines if routes are disrupted
- **Data Flow**:
  - Monthly pulse runs calculation functions via existing on_monthly_pulse hook
  - Results stored in global variables and county modifiers
  - Updates trade node controller attributes
- **Leverages Existing APIs**:
  - Uses standard scripted value calculation methods like GetValue and ScriptValue
  - Utilizes existing economic modifiers including monthly_income_mult and tax_mult

### 2.4 Trade Prosperity System

**Files**: `common/modifiers/trade_prosperity_modifiers.txt`

- **Implementation**: Converts trade activity to county development
- **Key Functions**:
  - `calculate_trade_prosperity_level_effect` - Sets prosperity level
  - `apply_trade_prosperity_modifiers_effect` - Applies modifiers to counties
- **Modifiers**:
  - Uses existing development_growth_factor modifiers
  - Leverages tax_mult and monthly_income modifiers
  - Special building unlocks based on prosperity level
- **Integration Points**:
  - County development system
  - Tax system
  - Council task system

### 2.5 Cultural Exchange System

**Files**: `common/scripted_effects/cultural_exchange_effects.txt`

- **Implementation**: Models innovation spread through trade
- **Key Functions**:
  - `calculate_trade_cultural_exposure_effect` - Determines cultural exchange level
  - `trade_innovation_spread_chance_trigger` - Checks if innovation can spread
- **Integration Points**:
  - Culture system
  - Innovation system
  - Hybrid culture formation events
  - Uses existing culture_acceptance modifiers

### 2.6 Merchant Organization System

**Files**: `common/merchant_guilds/`, `common/scripted_effects/merchant_guild_effects.txt`

- **Implementation**: Creates semi-autonomous merchant organizations
- **Data Structure**:
  ```
  merchant_organization = {
      id = "hanseatic_league"
      name = "hanseatic_league_name"
      center_nodes = { lubeck_node hamburg_node }
      member_nodes = { node_id_1 node_id_2 node_id_3 ... }
      power_level = value_calculation # How influential the organization is
      autonomous_level = 0.7 # How independent from rulers they operate
  }
  ```
- **Key Functions**:
  - `calculate_guild_influence_effect` - Determines organization power in a region
  - `guild_rivalry_trigger` - Checks for competition between organizations
  - `guild_character_relation_effect` - Handles interactions between rulers and guild masters
- **Integration Points**:
  - Character system (guild leaders are characters with special privileges)
  - County control (guilds have indirect influence on counties)
  - Opinion system (relations between rulers and guild leaders)

### 2.7 Religious Trade System

**Files**: `common/scripted_effects/religious_trade_effects.txt`

- **Implementation**: Connects pilgrimage routes with trade networks
- **Data Structure**:
  ```
  religious_trade_center = {
      id = "mecca_pilgrimage"
      faith = "ashari"
      province = province_id
      pilgrimage_bonus = 0.25  # Trade boost during pilgrimage seasons
      trade_goods_boost = { incense perfume }
  }
  ```
- **Key Functions**:
  - `calculate_pilgrimage_trade_bonus_effect` - Determines trade boosts from pilgrimages
  - `religious_restriction_trigger` - Checks if trade is restricted based on faith relations
  - `religious_order_trade_effect` - Handles special trade benefits from religious orders
- **Integration Points**:
  - Faith system
  - Pilgrimage mechanics
  - Religious head interactions
  - Holy site mechanics

### 2.8 River Trade System

**Files**: `common/river_trade_routes/`, `common/scripted_effects/river_trade_effects.txt`

- **Implementation**: Creates specialized river-based trade routes
- **Data Structure**:
  ```
  river_trade_route = {
      id = "dnieper_route"
      name = "dnieper_trade_route_name"
      nodes = { node_id_1 node_id_2 node_id_3 ... }
      seasonal_modifiers = {
          winter = { throughput = -0.5 }  # Frozen rivers
          spring = { throughput = 0.2 }   # High water
      }
      required_control_ratio = 0.5  # Percentage of river counties needed for control
  }
  ```
- **Key Functions**:
  - `calculate_river_trade_effect` - Specialized calculations for river trade
  - `check_river_navigability_trigger` - Seasonal effects on river trade
  - `determine_river_control_effect` - Calculates who controls river segments
- **Integration Points**:
  - County system (riverine counties)
  - Terrain system
  - Seasonal effects
  - Special river terrain modifiers

### 2.9 Maritime Innovation System

**Files**: `common/trade_technologies/maritime_innovations.txt`

- **Implementation**: Tracks naval technology development for trade
- **Data Structure**:
  ```
  maritime_innovation = {
      id = "magnetic_compass"
      prerequisites = { "nautical_charts" }
      effects = {
          sea_trade_efficiency = 0.15
          naval_travel_speed = 0.1
          trade_route_max_distance = 2
      }
      unlock_era = culture_era_early_medieval
  }
  ```
- **Key Functions**:
  - `apply_maritime_innovation_effects` - Updates trade calculations based on innovations
  - `check_maritime_capability_trigger` - Determines realm naval trade capabilities
  - `upgrade_maritime_technology_effect` - Process for acquiring naval innovations
- **Integration Points**:
  - Innovation system
  - Cultural era system
  - Naval travel mechanics
  - Learning-based development

### 2.10 Trade Technology System

**Files**: `common/trade_technologies/financial_innovations.txt`

- **Implementation**: Represents financial and commercial innovations
- **Data Structure**:
  ```
  financial_innovation = {
      id = "bills_of_exchange"
      prerequisites = { "merchant_guilds" }
      effects = {
          trade_income_mult = 0.1
          long_distance_trade_efficiency = 0.15
          trade_route_disruption_resistance = 0.2
      }
      unlock_conditions = {
          has_trait = education_stewardship_3
          num_of_trade_posts > 3
          # Historical restriction
          year >= 1150
      }
      # Regional restrictions for innovations that appeared first in specific areas
      regional_early_unlock = {
          culture_group = latin
          year >= 1100
      }
  }
  ```
- **Key Functions**:
  - `check_financial_innovation_spread_trigger` - Determines how innovations spread
  - `apply_financial_innovation_effect` - Updates economic calculations
  - `trade_technology_discovery_effect` - Handles new innovation discovery events
- **Historical Progression**:
  - Early-game (867-1000): Basic trade mechanics only, limited financial instruments
  - Mid-game (1000-1200): Introduction of merchant banks, early credit systems
  - Late-game (1200-1453): Advanced banking systems, bills of exchange, complex financial networks
  - Banking innovations restricted to appropriate timeframes:
    - Bills of exchange only available after ~1150
    - Banking houses restricted to Italian regions until ~1200, then spreading outward
    - Advanced financial instruments locked to Late Medieval era (post-1200)
    - Requires educated characters with appropriate knowledge
- **Integration Points**:
  - Learning lifestyle
  - Character traits
  - Cultural innovations
  - Development system
  - Game year checks for historical accuracy

### 2.11 Empire Peace Effects System

**Files**: `common/scripted_effects/trade_peace_effects.txt`

- **Implementation**: Models political stability's impact on trade
- **Data Structure**:
  ```
  # Used within scripted effects
  empire_trade_safety = {
      safety_bonus = {
          # Calculate based on empire size and integrity
          value = empire_size_value
          multiply = empire_internal_peace_factor
          min = 0
          max = 0.75
      }
      collapse_penalty = {
          # Penalty when large empires fragment
          value = previous_safety_bonus
          multiply = 1.5
          max = 0.8
      }
  }
  ```
- **Key Functions**:
  - `calculate_empire_trade_safety_effect` - Determines peace bonuses from large stable realms
  - `apply_empire_collapse_penalty_effect` - Handles disruption when empires fragment
  - `check_trade_route_political_stability_trigger` - Evaluates route safety
- **Integration Points**:

  - Realm size calculations
  - Internal realm stability
  - Civil war detection
  - Title gain/loss events
  - Pax Mongolica effects only active in appropriate period (~1250-1350)

- **Key Functions**:
  - `get_current_trade_era_effect` - Determines current historical trade period
  - `check_system_availability_trigger` - Verifies if specific trade mechanics are available
  - `unlock_era_features_effect` - Activates new features when entering a new era
  - `determine_regional_trade_advancement_effect` - Gives certain regions early access to innovations
- **Integration Points**:
  - Game year system
  - Cultural advancement
  - Region-specific unlocks (e.g., Italian banking, Chinese naval tech)
  - Technology system
  - Innovation spread
- **Trade Eras**:

  - **Early Medieval Trade (867-1000)**:

    - Basic trade routes and simple markets
    - Limited financial instruments (basic loans only)
    - No long-distance explorer mechanics
    - Restricted to historical trade patterns of the period
    - No banking houses or advanced financial systems
    - River trade dominant in Eastern Europe
    - Limited sea trade (primarily Mediterranean and Baltic)

  - **High Medieval Trade (1001-1200)**:
    - Regional trade networks develop
    - Early banking innovations (Italian regions first)
    - Trade fairs begin to emerge (~1150 for Champagne fairs)
    - Limited exploration possible (maximum travel distance increased)
    - Early merchant organizations form
    - Bills of exchange introduced (~1150)
    - Expanded Mediterranean maritime trade
  - **Late Medieval Trade (1201-1453)**:
    - Global trade networks
    - Advanced banking systems spread beyond Italy
    - Complex financial instruments available
    - Full explorer mechanics (Marco Polo style journeys)
    - Hanseatic League and similar organizations (~1350+)
    - Specialized merchant republics reach peak power
    - Advanced maritime technologies widely available
    - Pax Mongolica effects (during ~1250-1350 period)

- **Regional Variations**:
  - Italian regions: Banking innovations available ~50-100 years earlier
  - Byzantine regions: Advanced trade systems in early periods
  - Song China: Maritime innovations available earlier in Eastern regions
  - Islamic world: Early financial innovations during Abbasid period
- **Transition System**:
  - Era changes trigger notification events
  - New mechanics gradually phase in near era boundaries
  - Major historical events can accelerate or delay transitions
  - Game rule option to disable historical restrictions

## 3. Player Interaction Systems

### 3.1 Trade Buildings System

**Files**: `common/buildings/trade_buildings.txt`

- **Implementation**: Extends vanilla building system with trade structures
- **Data Structure**:

  ```
  building = {
      type = trade_post
      asset = "trade_post_01"
      prerequisites = { has_trade_route_in_county }
      desc = building_trade_post_desc
      gold_cost = 150
      build_time = 365

      effects = {
          county_trade_value_add = 1
          county_tax_modifier = 0.05
          county_development_growth_factor = 0.05
      }

      upgrades_from = traded_goods_market
  }
  ```

- **Integration Points**:
  - Vanilla building system
  - Holding types
  - County effects system
  - Plugs into the on_holding_building_constructed on-action

### 3.2 Character Interaction System

**Files**: `common/character_interactions/trade_interactions.txt`

- **Implementation**: Adds trade-related character actions
- **Data Structure**:

  ```
  establish_trade_agreement_interaction = {
      category = diplomatic
      desc = establish_trade_agreement_desc

      is_shown = { trade_agreement_can_be_established_trigger = yes }
      is_valid_showing_failures_only = { ... }

      on_accept = {
          create_trade_agreement_between_realms_effect = { target = scope:recipient }
      }

      ai_accept = { ... }
  }
  ```

- **Integration Points**:
  - Character interaction system
  - Diplomatic system
  - Opinion system
  - Uses character scope and existing AI behavior for decisions

### 3.3 Trade Policy System

**Files**: `common/decisions/trade_policy_decisions.txt`

- **Implementation**: Realm-wide trade approaches via decisions
- **Data Structure**:

  ```
  decision_set_trade_policy = {
      title = set_trade_policy_title
      desc = set_trade_policy_desc
      selection_tooltip = set_trade_policy_tooltip

      is_shown = { is_ruler = yes }
      effect = { set_variable = trade_policy_X }
  }

  law_trade_tariffs = {
      group = realm

      is_valid = { ... }

      tax_modifier = 0.1
      development_growth_factor = -0.05
      merchant_guild_opinion = -10 # New modifier for guild relations
  }
  ```

- **Integration Points**:
  - Law system
  - Decision system
  - Character opinion system
  - Merchant guild relations
  - Utilizes the on_realm_law_changed on-action

### 3.4 Caravan Events System

**Files**: `events/trade_caravan_events.txt`

- **Implementation**: Narrative events using travel system
- **Data Structure**:

  ```
  trade.1001 = { # Caravan arrival event
      type = character_event
      title = trade.1001.t
      desc = trade.1001.desc

      trigger = { has_caravan_arriving_trigger = yes }

      immediate = { setup_caravan_event_effect = yes }

      option = {
          name = trade.1001.a
          ai_chance = { base = 10 }
          custom_tooltip = caravan_goods_accepted_tooltip

          accept_caravan_goods_effect = yes
      }
  }
  ```

- **Integration Points**:
  - Standard event system
  - Travel system with travel_plan scope
  - Uses the existing random events framework
  - Leverages the on_character_travel_start on-action
  - Compatible with existing fp1_trade_events_random on-action

### 3.5 Trade Fair System

**Files**: `common/activities/trade_fair.txt`, `events/trade_fair_events.txt`

- **Implementation**: Special economic and diplomatic events
- **Data Structure**:

  ```
  activity = {
      type = trade_fair

      cooldown = { months = 24 }

      trigger = {
          has_trade_fair_capability_trigger = yes
      }

      ai_accept = { base = 25 }

      on_start = { trade_fair_begin_effect = yes }
      on_end = { trade_fair_end_effect = yes }
  }
  ```

- **Events**:

  ```
  trade_fair.1001 = { # Merchant arrival event
      type = character_event
      title = trade_fair.1001.t
      desc = trade_fair.1001.desc

      trigger = { is_hosting_trade_fair_trigger = yes }

      immediate = { setup_merchant_visitor_effect = yes }

      option = {
          name = trade_fair.1001.a
          ai_chance = { base = 10 }
          custom_tooltip = merchant_negotiations_tooltip

          begin_merchant_negotiations_effect = yes
      }
  }
  ```

- **Integration Points**:
  - Activity system (similar to hunts, feasts)
  - Event system
  - County modifiers for fair location
  - Character interaction system
  - Uses existing activity framework like ActivityType and activity phases

### 3.6 Interface System

**Files**: `gui/trade_window.gui`, `gui/trade_route_mapmode.gui`

- **Implementation**: Custom UI elements for trade mechanics
- **Components**:
  - Trade map mode
  - Trade route display
  - Trade node interaction windows
  - Trade goods overview
- **Integration Points**:
  - Map rendering system
  - UI framework
  - Tooltip system
  - Extends existing map modes like the economy map mode (GetEconomyMapModeTooltip)

### 3.7 Lifestyle System

**Files**: `common/lifestyle_focuses/trade_focuses.txt`, `common/lifestyle_perks/trade_perks.txt`

- **Implementation**: Trade-oriented character development options
- **Data Structure**:

  ```
  focus = {
      key = mercantile_focus
      lifestyle = stewardship  # Integrates with existing stewardship lifestyle
      icon = focus_mercantile

      desc = focus_mercantile_desc

      character_modifier = {
          trade_income_mult = 0.15
          diplomacy_per_month = 0.1
      }
  }

  perk = {
      key = trade_network_perk
      focus = mercantile_focus
      position = { 1 2 }

      effect = {
          unlock_trade_network_decisions_effect = yes
          add_character_modifier = trade_network_bonus
      }
  }
  ```

- **Integration Points**:
  - Existing lifestyle system
  - Perk trees
  - Character modifiers
  - Extends the stewardship lifestyle

### 3.8 Merchant Republic System

**Files**: `common/government_types/merchant_republic_types.txt`, `events/merchant_republic_events.txt`

- **Implementation**: Special systems for merchant republics
- **Data Structure**:

  ```
  government = {
      type = merchant_republic_government

      valid_holdings = { CITY }
      preferred_holdings = { CITY }

      vassal_contract = merchant_republic_contract

      can_create_kingdoms = yes
      can_create_empires = yes
      uses_prestige_for_law_change = no
  }
  ```

- **Key Mechanics**:
  - Patrician family competition
  - Trading posts in foreign counties
  - Special succession mechanics
  - Guild quarters management
  - Trade fleet mechanics
  - Features expand as appropriate for historical period
- **Integration Points**:
  - Government system
  - Succession system
  - Building system (special republic buildings)
  - County interaction for foreign trading posts
  - Special modifiers for merchant republic development

### 3.9 Explorer Mechanics System

**Files**: `common/character_interactions/explorer_interactions.txt`, `events/explorer_events.txt`

- **Implementation**: Character journeys for trade opportunities
- **Data Structure**:

  ```
  character_interaction = {
      key = sponsor_trade_expedition

      is_shown = {
          has_sufficient_funds_trigger = yes
          has_stewardship_or_learning_focus_trigger = yes
          # Historical restrictions
          OR = {
              # Limited journeys in middle period
              AND = {
                  is_game_year >= 1100
                  is_game_year < 1200
                  # Limited to Mediterranean/Near East
                  expedition_distance_trigger = { max_distance = medium }
              }
              # Marco Polo era journeys
              AND {
                  is_game_year >= 1200
                  # Can travel to Far East
                  expedition_distance_trigger = { max_distance = far }
              }
          }
      }

      effect = {
          start_explorer_expedition_effect = {
              destination = scope:destination_province
              expedition_type = trade_expedition
          }
      }
  }
  ```

- **Key Functions**:
  - `start_explorer_expedition_effect` - Initiates journey with special trade discovery opportunities
  - `explorer_return_effect` - Handles knowledge and goods brought back
  - `discover_new_trade_route_effect` - Opens new trade connections based on expeditions
- **Historical Progression**:
  - Early game (867-1100): Very limited exploration (neighboring regions only)
  - Mid game (1100-1200): Medium-distance journeys possible
  - Late game (1200-1453): Far-reaching expeditions like Marco Polo available
  - Distance limits based on historical period
  - Character knowledge requirements increase with distance
- **Integration Points**:
  - Travel system
  - Character interactions
  - Knowledge spreading system
  - Court artifacts for distant treasures

### 3.10 Regional Trade Networks

**Files**: `common/scripted_effects/regional_trade_effects.txt`

- **Implementation**: Specialized mechanics for historical regions
- **Key Components**:
  - Viking trade networks (Baltic and North Sea)
  - Abbasid commercial system (Baghdad, Basra)
  - Samanid Silk Road segment
  - Indian Ocean trade system
  - Song Dynasty maritime network
  - West African gold trade
  - Mediterranean trade basin
- **Integration Points**:
  - Cultural mechanics
  - Regional terrain features
  - Special nodes for historical trading centers
  - Unique goods for each region
- **Historical Era**:
  - Networks evolve based on appropriate historical periods

## 4. Integration Systems

### 4.1 Royal Court Integration

**Files**: `common/court_positions/trade_court_positions.txt`, `common/artifacts/trade_artifacts.txt`

- **Implementation**: Enhances Royal Court DLC with trade elements
- **Components**:
  - Court positions for trade representatives
  - Trade artifacts with special bonuses
  - Court events related to foreign merchants
- **Integration Points**:
  - Court system (CourtType, CourtPositionType)
  - Artifact system (ArtifactType)
  - Court grandeur
  - Uses court_grandeur_modifier for trade good consumption

### 4.2 Vassal Contract Integration

**Files**: `common/vassal_contracts/trade_obligations.txt`

- **Implementation**: Extends vassal contracts with trade terms
- **Data Structure**:

  ```
  vassal_contract_obligation = {
      key = trade_tax_obligation

      levels = {
          level_0 = { vassal_opinion = 0 }
          level_1 = { vassal_opinion = -5 trade_tax_contribution = 0.1 }
          level_2 = { vassal_opinion = -15 trade_tax_contribution = 0.25 }
      }
  }
  ```

- **Integration Points**:
  - Vassal contract system
  - Obligations framework
  - Opinion system
  - Leverages existing vassal_tax_contribution_mult/add modifiers

### 4.3 Northern Lords Integration

**Files**: `events/northern_lords_trade_events.txt`

- **Implementation**: Integration with Northern Lords flavor pack trade content
- **Components**:
  - Compatible events with existing fp1_trade_events system
  - Extensions to viking trade mechanics
  - Custom northern trade goods
- **Integration Points**:
  - Uses existing fp1_trade_events_cycle and fp1_trade_events_random on-actions
  - Compatible with fp1 legacy perks (adventure and pillage tracks)
  - Enhances viking trade and raiding mechanics

### 4.4 Regional Trade Networks

**Files**: `common/scripted_effects/regional_trade_effects.txt`

- **Implementation**:
  - Region-specific trade mechanics and historical networks
  - Networks evolve based on appropriate historical periods
- **Key Components**:
  - Viking trade networks (Baltic and North Sea)
  - Abbasid commercial system (Baghdad, Basra)
  - Samanid Silk Road segment
  - Indian Ocean trade system
  - Song Dynasty maritime network
  - West African gold trade
  - Mediterranean trade basin
- **Integration Points**:
  - Cultural mechanics
  - Regional terrain features
  - Special nodes for historical trading centers
  - Unique goods for each region

## 5. Utility Systems

### 5.1 Script Values

**Files**: `common/script_values/trade_values.txt`

- **Implementation**: Defines constants and calculations for trade systems
- **Key Values**:
  - Trade route base values
  - Prosperity thresholds
  - AI behavior weights
  - Economic balancing factors
- **API Integration**:
  - Uses standard script value methods and calculations
  - Leverages GetValue, GetScriptValueDesc, and script value manipulation functions
  - Compatible with ValueBreakdown for detailed value inspection

### 5.2 Scripted Effects

**Files**: `common/scripted_effects/trade_effects.txt`

- **Implementation**: Reusable effect blocks for trade mechanics
- **Key Effects**:
  - `setup_trade_route_effect`
  - `calculate_trade_income_effect`
  - `apply_trade_opinion_effect`
  - `destroy_trade_route_effect`
- **API Integration**:
  - Standard effect structure following vanilla conventions
  - Uses topscope and character scope effect standards
  - Utilizes save_temporary_scope for route calculations

### 5.3 Scripted Triggers

**Files**: `common/scripted_triggers/trade_triggers.txt`

- **Implementation**: Reusable condition checks for trade mechanics
- **Key Triggers**:
  - `can_build_trade_building_trigger`
  - `is_on_active_trade_route_trigger`
  - `has_profitable_trade_goods_trigger`
  - `can_establish_trade_agreement_trigger`
- **API Integration**:
  - Standard trigger structure following vanilla conventions
  - Compatible with standard trigger manipulations (NOT, AND, OR)
  - Uses scope manipulation consistent with vanilla triggers

### 5.4 On Actions

**Files**: `common/on_action/trade_on_actions.txt`

- **Implementation**: Event hooks for game events
- **Key On Actions**:
  - `on_county_occupied` - disrupts trade routes
  - `on_monthly_pulse` - updates trade calculations
  - `on_realm_law_changed` - updates trade policies
  - `on_character_travel_start` - potential caravan events
  - Adds handlers for existing `fp1_trade_events_cycle` and `fp1_trade_events_random`
- **API Integration**:
  - Hooks into standard vanilla on-actions
  - Custom on-actions follow vanilla naming conventions
  - Compatible with random_events_weight and triggered_events structures

## 6. Data Flow

```
                                 ┌─────────────────┐
                                 │Monthly On-Action│
                                 └────────┬────────┘
                                          │
                                          ▼
┌─────────────┐  affects  ┌──────────────────────────┐  affects  ┌───────────────┐
│Trade Routes ├──────────►│  Trade Flow Calculation  ├──────────►│ Trade Nodes   │
└─────────────┘           └────────────┬─────────────┘           └───────────────┘
      ▲                                │                                 ▲
      │                                ▼                                 │
      │                   ┌────────────────────────┐                    │
      │                   │Apply Prosperity Modifiers│                  │
      │                   └────────────┬────────────┘                   │
      │                                │                                 │
      │                                ▼                                 │
┌─────────────┐   affects  ┌─────────────────────┐  affects   ┌───────────────┐
│  Buildings  │◄──────────►│   County Effects    ├───────────►│Character Effects│
└─────────────┘            └─────────────────────┘            └───────────────┘
      ▲                              ▲                                ▲
      │                              │                                │
      │                    ┌─────────┴────────────┐                   │
      │                    │ Merchant Organizations│                  │
      │                    └─────────┬────────────┘                   │
      │                              │                                │
      │                   ┌──────────┴────────────┐                   │
      └───────────────────┤ Player Interactions   ├───────────────────┘
                          └─────────┬─────────────┘
                                    │
                          ┌─────────▼────────────┐
                          │ Special Systems       │
                          │ - Religious Trade     │
                          │ - River Routes        │
                          │ - Maritime Tech       │
                          │ - Explorer Journeys   │
                          │ - Empire Peace Effects│
                          └──────────────────────┘

```

## 7. Implementation Notes

### 7.1 Performance Considerations

- Trade flow calculations should be optimized to run efficiently on monthly pulse
- Node control changes should be event-driven rather than checked continuously
- Cache trade route data for provinces to avoid recalculation
- Use on-demand calculation for UI elements to minimize overhead

### 7.2 Compatibility

- All systems should gracefully degrade if DLCs are missing
- Check for feature availability before executing Royal Court specific code
- Maintain clean separation between core systems and DLC-dependent features
- Use flags to track mod compatibility with game versions
- Special handling for Northern Lords content to ensure seamless integration

### 7.3 Modding Support

- Create clear documentation for adding new trade goods
- Provide API-like interfaces for extending trade routes
- Use namespaced variables to prevent conflicts with other mods
- Create debugging console commands for testing trade systems

### 7.4 Saving and Loading

- Store trade system state in global variables
- Ensure trade data is properly saved and loaded from saves
- Initialize trade systems properly when loading existing saves
- Handle migration of trade data between mod versions

### 7.6 Historical Accuracy Timeline

To maintain historical accuracy, the mod implements the following timeline restrictions:

**Early Medieval Period (867-1000)**

- Basic land and river trade routes
- Simple goods exchange
- Religious trade networks
- No advanced financial instruments
- Limited maritime trade
- No explorer mechanics

**High Medieval Period (1001-1200)**

- Expanded trade networks
- Early fairs (Champagne fairs begin c. 1150)
- Basic merchant guilds
- Early financial innovations in Italian city-states
- Growing maritime trade
- Limited regional exploration

**Late Medieval Period (1201-1453)**

- Advanced global trade networks
- Complex banking systems (bills of exchange, banking houses)
- Sophisticated merchant guilds and companies
- Advanced maritime technologies (magnetic compass in common use)
- Long-distance exploration (Marco Polo's journey c. 1271-1295)
- Pax Mongolica trade benefits

These restrictions ensure players experience a historically plausible progression of trade mechanics as the game advances through centuries.

## 8. Development Roadmap

1. Core data structures and basic trade route definition
2. Trade goods system with production/consumption
3. Flow calculation and county effects
4. Trade buildings
5. Northern Lords integration for existing trade events
6. Character interactions and council positions
7. Interface elements
8. Events and decisions
9. DLC integrations
10. Balance and testing

## 9. Tutorial and Guidance System

### 9.1 Concept

**Files**: `events/trade_tutorial_events.txt`, `gui/trade_tutorial_window.gui`

- **Implementation**: Progressive tutorial events and tooltips that introduce trade mechanics to players
- **Design Philosophy**: "Learn by doing" approach that teaches mechanics when they become relevant

### 9.2 Components

#### 9.2.1 Tutorial Events Chain

- **Initial Introduction**: Triggered when player first encounters trade mechanics
- **System-Specific Tutorials**: Separate tutorial events for each major system
- **Progressive Complexity**: Tutorials unlock as player advances in trade capability
- **Era-Based Guidance**: New tutorials appear when new mechanics unlock

#### 9.2.2 Context-Sensitive Help

- **Hoverable Info Icons**: Added to all trade UIs for detailed explanations
- **Suggestion System**: Contextual suggestions based on player's current situation
- **Trade Advisor**: Optional character interaction with a "trade advisor" character who provides guidance

#### 9.2.3 Guided Tasks

- **Tutorial Decisions**: Simple trade-related tasks that teach basic mechanics
- **Achievement Framework**: Small rewards for completing tutorial stages
- **Reference Guide**: Accessible encyclopedia of trade concepts and mechanics

### 9.3 Complexity Management

- **Tiered Interface**: Basic view with essential information, expandable to detailed view
- **Complexity Settings**: Game rule to adjust tutorial frequency and detail level
- **Auto-Suggestion**: Optional automated suggestions for optimal trade actions
- **Quick Reference**: One-click access to essential trade information

### 9.4 Integration Points

- **Hooks into Vanilla Tutorial**: Extends existing tutorial framework
- **Character Events**: Tutorial content delivered through character events
- **Interface Hints**: Uses vanilla tooltip and hint system
- **Game Rules**: Respects player's tutorial preferences set in game rules

## 10. Visual Feedback System

### 10.1 Concept

**Files**: `gui/trade_visual_indicators.gui`, `gfx/interface/icons/trade_states/`

- **Implementation**: Rich visual feedback for trade system state and performance
- **Design Philosophy**: Critical information should be understood at a glance

### 10.2 Components

#### 10.2.1 Map Visualization

- **Trade Route Rendering**: Routes colored by prosperity/disruption status
- **Node Icons**: Visual indicators of node specialization and value
- **Prosperity Indicators**: County coloring based on trade prosperity levels

#### 10.2.2 UI Enhancement

- **Trade Flow Diagrams**: Interactive flowcharts showing good movement
- **Prosperity Meter**: Visual gauge of county prosperity level
- **Route Health Indicator**: Traffic-light system for route status
- **Income Breakdown**: Visual breakdown of trade income sources
- **Network Graph**: Interactive network visualization of connected trade nodes

#### 10.2.3 Animation and Effects

- **Caravan Animation**: Visual representation of active trade along routes
- **Prosperity Effects**: Visual effects on counties with high trade prosperity
- **Era Transition Effects**: Special effects when entering new trade eras
- **Buildings Visualization**: Enhanced building icons showing trade activity levels

### 10.3 Visual Accessibility

- **Color-Blind Modes**: Alternative visual indicators for color-blind players
- **Scaling Options**: Adjustable icon sizes and visual indicators
- **Simplified View**: Toggle for reduced visual complexity
- **Custom Themes**: Options for different visual styles of trade indicators

### 10.4 Integration Points

- **Map Modes**: New "Trade" map mode with multiple visualization options
- **County Window**: Enhanced county view with trade prosperity indicators
- **Character Interface**: Visual indicators of character trade involvement
- **Notification System**: Visual alerts for significant trade events
- **Settings Menu**: Visual feedback configuration options

## 11. AI Trade Behavior System

### 11.1 Concept

**Files**: `common/scripted_triggers/trade_ai_triggers.txt`, `common/scripted_effects/trade_ai_effects.txt`

- **Implementation**: Robust AI decision-making for trade mechanics
- **Design Philosophy**: Create believable AI trade behavior based on character traits and realm situation

### 11.2 Components

#### 11.2.1 AI Evaluation Functions

- **Trade Investment Evaluation**: AI logic for building trade structures
- **Route Priority Assessment**: How AI evaluates which trade routes to develop
- **Character Interaction Evaluation**: Decision logic for merchant-related interactions
- **Trade Policy Selection**: AI criteria for choosing trade policies
- **Risk-Reward Calculation**: Logic for explorer expeditions and investments

#### 11.2.2 AI Strategy Profiles

- **Merchant Focus**: Primary emphasis on trade development
  - **Aggressive Trader**: Expands trade aggressively, even at diplomatic cost
  - **Diplomatic Trader**: Uses trade to build relationships and alliances
  - **Monopolist**: Seeks to control key trade routes exclusively
- **Balanced Focus**: Moderate trade emphasis
  - **Pragmatist**: Invests in trade when profitable, but balances with other priorities
  - **Opportunist**: Capitalizes on trade opportunities without long-term strategy
  - **Developer**: Uses trade primarily to boost realm development
- **Minimal Focus**: Limited trade emphasis
  - **Isolationist**: Minimal engagement with foreign trade
  - **Reactive**: Only engages with trade when necessary
  - **Exploiter**: Uses trade primarily for short-term gain

#### 11.2.3 Trait-Based Behavior

- **Greedy Characters**: Higher priority on immediate trade profits
- **Ambitious Characters**: More likely to invest in long-term trade development
- **Arrogant Characters**: Prefer prestigious luxury goods
- **Content Characters**: Less likely to disrupt existing trade patterns
- **Diligent Characters**: Better trade route management
- **Stewardship Education**: Increases trade competence

#### 11.2.4 Dynamic Adaptation

- **Economic State Awareness**: Adjusts strategy based on realm wealth
- **Threat Assessment**: Modifies trade routes based on nearby hostile realms
- **Cultural Context Adaptation**: Different behavior for merchant republics vs feudal realms
- **Historical Adjustment**: AI strategy evolves as new trade mechanics unlock

### 11.3 Performance Optimization

- **Tiered Decision Making**: Quick simple evaluations for routine decisions
- **Scheduled Evaluation**: Major strategy reassessment at regular intervals
- **Caching System**: Stores evaluation results for similar conditions
- **Priority-Based Processing**: More CPU time for player-adjacent AI characters

### 11.4 Integration Points

- **Character AI**: Hooks into vanilla character AI system
- **Diplomatic AI**: Coordinates with diplomatic decision making
- **War AI**: Considers trade routes in military planning
- **Economic AI**: Factors trade into overall economic strategy
- **Construction AI**: Balances trade buildings with other construction

### 11.5 Feedback and Predictability

- **AI Intention Hints**: Optional indicators of AI trade strategy
- **Reaction Prediction**: Tooltips predicting AI response to player trade actions
- **Strategy Reveal**: Character interactions to learn about AI trade intentions
- **Transparent Decision Logic**: Clear tooltips explaining AI trade decisions
