# EXPANDED TRADE MOD - TODO LIST

## 1. Initial Setup

- [x] Create `descriptor.mod` file with mod name, supported version, and tags
- [x] Create `common/` folder for game rules and systems
- [x] Create `events/` folder for event scripts
- [x] Create `localization/english/` folder for text
- [x] Create `gfx/` folder for images and icons
- [x] Create `gui/` folder for UI elements

## 1A. MVP Features

The following features constitute the Minimum Viable Product (MVP) for the first release:

### Core Systems

- [x] **Trade Route Network** - Basic Silk Road main route with key nodes

  - [x] Create `common/trade_routes/silk_road_main.txt` defining primary Silk Road path
    - [x] Implement core route structure with id, name, and ordered nodes
    - [x] Define essential land_routes and sea_routes connections between adjacent nodes
    - [x] Add minimal historical descriptions for flavor
    - [x] Create basic route status flags (active, disrupted)
    - [x] Set standard trade flow capacity for the main route
    - [x] Utilize existing province connection system for route validation (requires game integration)
    - [ ] Implement compatibility with travel_plan scope from base game (requires game integration)

- [x] **Trade Node System** - Essential trade hubs with simple connection rules

  - [x] Create `common/trade_nodes/silk_road_nodes.txt` with key trade centers
    - [x] Define core node data structure with county/province connections
    - [x] Implement basic controller scope using existing county owner mechanics
    - [ ] Create simple value calculation using existing development level (requires game integration)
    - [x] Limit to essential nodes (Constantinople, Baghdad, Samarkand, etc.)
    - [x] Use existing county system for node placement
    - [ ] Implement straightforward node connection rules leveraging adjacency (requires game integration)
    - [ ] Ensure compatibility with existing province system using province_id references (requires game integration)

- [ ] **Trade Good Distribution** - Limited set of luxury and common goods

  - [ ] Create `common/trade_goods/mvp_trade_goods.txt` with basic goods
    - [ ] Implement core good categories (luxury, common) with minimal types
    - [ ] Define basic production rules based on vanilla terrain types
    - [ ] Create simple consumption rules using existing character scope
    - [ ] Limit to essential goods (silk, spices, fur, metals, etc.)
    - [ ] Leverage existing terrain and building systems for production placement
    - [ ] Use vanilla localization for luxury goods where available
    - [ ] Ensure compatibility with county terrain_type checks for production

- [ ] **Trade Flow Calculation** - Simple monthly calculations without advanced modifiers

  - [ ] Create `common/scripted_effects/trade_calculation_effects.txt` with core algorithms
    - [ ] Implement simplified monthly flow calculation effect
    - [ ] Create basic node value determination based on development and goods
    - [ ] Add simple goods distribution that follows route connections
    - [ ] Create route efficiency calculation based on county control
    - [ ] Implement hooks into on_monthly_pulse for regular updates
    - [ ] Use existing scope system for efficient calculation
    - [ ] Ensure compatibility with GetValue and ScriptValue API

- [ ] **Trade Prosperity Effects** - Basic development and income bonuses

  - [ ] Create `common/modifiers/trade_prosperity_modifiers.txt` for county effects
    - [ ] Implement tiered prosperity levels (low, medium, high)
    - [ ] Create basic development_growth_factor modifiers (0.1, 0.2, 0.3)
    - [ ] Add simple tax_mult and monthly_income modifiers
    - [ ] Implement monthly_county_control_contribution for trade-active counties
    - [ ] Use existing modifier system for application
    - [ ] Ensure compatibility with development system using development_growth_factor
    - [ ] Create hooks with county scope for scripted triggers

- [ ] **Trade Triggers and Conditions** - Essential checks for trade functionality

  - [ ] Create `common/scripted_triggers/mvp_trade_triggers.txt` for basic conditions
    - [ ] Implement `is_on_silk_road_trigger` for county checks
    - [ ] Create `has_trade_good_trigger` for production verification
    - [ ] Add `has_trade_prosperity_trigger` with basic levels
    - [ ] Implement `can_build_trade_building_trigger` for prerequisites
    - [ ] Ensure compatibility with standard trigger structure
    - [ ] Use existing county scope and terrain checks
    - [ ] Leverage province adjacency system for route proximity checks

- [ ] **Trade Effects and Actions** - Core effects for basic trade operations

  - [ ] Create `common/scripted_effects/mvp_trade_effects.txt` for essential actions
    - [ ] Implement `setup_silk_road_effect` for initial configuration
    - [ ] Create `calculate_basic_trade_income_effect` for financial impact
    - [ ] Add `apply_trade_prosperity_effect` for county modifiers
    - [ ] Implement `disrupt_trade_route_effect` for war impacts
    - [ ] Follow standard effect format with clear scope expectations
    - [ ] Use existing county and character scope manipulation
    - [ ] Ensure compatibility with modifier application system

- [ ] **On-Action Hooks** - Minimal integration with game events

  - [ ] Create `common/on_action/mvp_trade_on_actions.txt` for essential hooks
    - [ ] Hook into `on_monthly_pulse` for trade calculations
    - [ ] Add `on_county_occupied` for route disruption
    - [ ] Implement `on_holding_building_constructed` for trade building effects
    - [ ] Create basic integration with `fp1_trade_events_random` if Northern Lords exists
    - [ ] Use standard on_action structure for compatibility
    - [ ] Implement basic event triggers for trade status changes
    - [ ] Ensure performance optimization with minimal monthly checks

- [ ] **Trade Variables and Flags** - Essential state tracking

  - [ ] Create `common/script_values/mvp_trade_variables.txt` for core state tracking
    - [ ] Implement global silk_road_status variable
    - [ ] Create county_trade_prosperity_level for local tracking
    - [ ] Add character_trade_participation for ruler engagement
    - [ ] Implement trade_route_disruption flags for war impacts
    - [ ] Use standard variable naming conventions
    - [ ] Ensure compatibility with save/load system
    - [ ] Leverage existing flag system for state tracking

- [ ] **Trade Modifiers** - Basic modifiers for county and character effects
  - [ ] Create `common/modifiers/mvp_trade_modifiers.txt` for core gameplay effects
    - [ ] Implement county_trade_value modifier for local prosperity
    - [ ] Create character_trade_income_mult for ruler benefits
    - [ ] Add building_trade_value_add for infrastructure bonuses
    - [ ] Implement trade_route_throughput for route quality
    - [ ] Use existing modifier system for integration
    - [ ] Ensure compatibility with monthly_income_mult and similar vanilla modifiers
    - [ ] Create icons for trade-specific modifiers

### Player Interaction

- [ ] **Trade Buildings** - Essential infrastructure (markets, trading posts, caravanserais)

  - [ ] Create `common/buildings/mvp_trade_buildings.txt` with core buildings
    - [ ] Design Market Square building for city holdings
      - [ ] Set gold_cost = 100 and build_time = 200
      - [ ] Add county_trade_value_add = 0.5 and tax_mult = 0.05
      - [ ] Use existing building system prerequisites (requires city_buildings_01)
    - [ ] Design Trading Post building for tribal and castle holdings
      - [ ] Set gold_cost = 150 and build_time = 300
      - [ ] Add county_trade_value_add = 0.75 and monthly_income = 0.2
      - [ ] Require county to be on trade route using is_on_silk_road_trigger
    - [ ] Design Caravanserai building for counties on major routes
      - [ ] Set gold_cost = 200 and build_time = 365
      - [ ] Add county_trade_value_add = 1 and development_growth_factor = 0.1
      - [ ] Implement special_building_slot = trade_post_slot for key locations
    - [ ] Ensure building upgrades follow vanilla pattern (level 1, 2, 3)
    - [ ] Use appropriate building flags for UI display (construction_category = economic)
    - [ ] Balance costs and benefits against vanilla economic buildings
    - [ ] Create appropriate building unlock conditions using scripted triggers

- [ ] **Merchant Character Interactions** - Basic set of character actions

  - [ ] Create `common/character_interactions/mvp_trade_interactions.txt` with essential interactions
    - [ ] Implement "Invite Merchant" interaction
      - [ ] Use category = diplomatic for proper UI placement
      - [ ] Implement is_shown using has_appropriate_rank_trigger from vanilla
      - [ ] Create on_accept effect to generate merchant character (uses generate_character effect)
      - [ ] Set cooldown = { days = 365 } for balance
      - [ ] Use ai_accept system with wealth and personality factors
    - [ ] Design "Establish Trade Agreement" interaction between rulers
      - [ ] Use category = diplomatic for proper UI placement
      - [ ] Add cost = { gold = 150 prestige = 100 } for balance
      - [ ] Create on_accept effect that boosts relations and trade (modify_opinion and set_variable)
      - [ ] Add ai_accept calculation based on opinion, distance, and existing trade activity
      - [ ] Implement scope validation using has_independent_realm_trigger or similar
    - [ ] Create "Sponsor Trade Expedition" interaction for increasing trade flow
      - [ ] Use category = diplomatic for proper UI placement
      - [ ] Set cost = { gold = 100 prestige = 50 }
      - [ ] Create on_accept effect to improve trade flow on specific route
      - [ ] Add ai_will_do based on stewardship and ambitious trait
      - [ ] Create event chain for success/failure using random_events_weight system
    - [ ] Ensure compatibility with vanilla interaction framework
    - [ ] Create proper interaction icons in `gfx/interface/icons/character_interactions/`
    - [ ] Add appropriate tooltip localizations in `localization/english/trade_interactions_l_english.yml`

- [ ] **Trade Policy Decisions** - Simple realm-wide policies

  - [ ] Create `common/decisions/mvp_trade_policy_decisions.txt` with basic policy options
    - [ ] Implement "Set Trade Stance" decision for realm policy
      - [ ] Create stances: Open (high flow, low tax), Balanced, Restrictive (low flow, high tax)
      - [ ] Set is_shown = { is_ruler = yes has_realm_size_trigger = { trigger_value >= small } }
      - [ ] Create decision effect to set realm trade policy variable
      - [ ] Add appropriate cooldown = { days = 1825 } (5 years)
      - [ ] Create ai_will_do calculations based on traits and economic situation
    - [ ] Design "Secure Trade Route" decision for protecting specific routes
      - [ ] Use is_shown that requires county on silk road and ruler control
      - [ ] Set cost = { gold = 250 prestige = 150 }
      - [ ] Create effects that reduce disruption chance and increase trade prosperity
      - [ ] Add time_to_complete = { days = 180 } for balance
      - [ ] Set ai_will_do based on county's trade value and realm wealth
    - [ ] Create "Promote Luxury Goods" decision for increasing high-end goods
      - [ ] Add is_shown requiring specific goods production in realm
      - [ ] Set cost = { gold = 200 prestige = 100 }
      - [ ] Create effects boosting specific trade good value for duration
      - [ ] Set cooldown = { days = 3650 } (10 years)
      - [ ] Use ai_will_do weighted by stewardship and appropriate traits
    - [ ] Use existing decision framework for compatibility
    - [ ] Create custom_tooltip fields for clear player feedback
    - [ ] Add appropriate icons in `gfx/interface/icons/decisions/`
    - [ ] Implement localization in `localization/english/trade_decisions_l_english.yml`

- [ ] **Silk Road Interface** - Basic map mode and information display
  - [ ] Create `gui/mvp_trade_mapmode.gui` for Silk Road visualization
    - [ ] Implement basic map mode showing trade routes with different colors
    - [ ] Create map objects for trade nodes using existing map system
    - [ ] Design route visualization with three states (prosperous, normal, disrupted)
    - [ ] Use vanilla map_modes.gui structure for compatibility
    - [ ] Implement tooltips showing route state and prosperity
    - [ ] Create node tooltips showing goods and value
    - [ ] Add trade map mode button to existing map mode selection panel
  - [ ] Create `gui/mvp_trade_window.gui` for detailed trade information
    - [ ] Design main trade info window following vanilla window patterns
    - [ ] Create tabs for Routes, Goods, and Policies
    - [ ] Implement route list showing status and value of each route section
    - [ ] Design goods list showing production and value in realm
    - [ ] Add current policies section showing active trade decisions
    - [ ] Create basic realm trade summary with income breakdown
    - [ ] Use vanilla widget templates for consistency (similar to economy window)
  - [ ] Create `gui/widgets/mvp_trade_tooltips.gui` for enhanced information display
    - [ ] Design county tooltip extension showing trade information
    - [ ] Create character tooltip extension for merchant characters
    - [ ] Implement holding tooltip additions for trade buildings
    - [ ] Use vanilla tooltip framework (DefaultTooltipWidget)
  - [ ] Create necessary graphics in `gfx/interface/` folders
    - [ ] Design route and node icons for map display
    - [ ] Create trade good icons for interface
    - [ ] Design window background and frame elements
    - [ ] Create status icons for prosperity and disruption
  - [ ] Implement localization in `localization/english/trade_interface_l_english.yml`
    - [ ] Add map mode name and description
    - [ ] Create tooltip text for all interface elements
    - [ ] Add heading and label text for windows
    - [ ] Include help text for new players

### Events and Content

- [ ] **Basic Trade Events** - Simple events for trade activity

  - [ ] Create `events/mvp_trade_events.txt` for general trade events
    - [ ] Implement "Trade Caravan Arrival" event
      - [ ] Use type = character_event for ruler interaction
      - [ ] Set trigger = { owns_county_with_trade_route_trigger = yes }
      - [ ] Create monthly_province_pulse_chance = { base = 1 }
      - [ ] Add options for accepting goods with wealth/prestige gains
      - [ ] Include options for turning away merchants with opinion consequences
      - [ ] Create ai_chance calculations based on traits and realm needs
    - [ ] Design "Local Goods Price Fluctuation" event
      - [ ] Use type = province_event for county-specific impact
      - [ ] Create seasonal triggers for appropriate timing
      - [ ] Add multiple outcomes based on trade good type
      - [ ] Implement temporary county modifier application
      - [ ] Set appropriate cooldown = { days = 365 }
    - [ ] Create "Merchant Dispute" event
      - [ ] Use type = character_event with involved_characters = { scope:merchant }
      - [ ] Generate random merchant character using generate_trader_effect
      - [ ] Add diplomatic resolution options with skill checks
      - [ ] Create options for justice versus profit with trait implications
      - [ ] Set appropriate opinion modifiers for outcomes
    - [ ] Implement simple economic events without advanced mechanics
    - [ ] Ensure hooks into existing on_action triggers for event firing
    - [ ] Keep event chains short (3-5 events maximum) for MVP
    - [ ] Use standard event system formatting and structure
    - [ ] Create basic event images in `gfx/interface/illustrations/events/`

- [ ] **Silk Road Events** - Limited set of events for the main trade route

  - [ ] Create `events/silk_road_events.txt` for Silk Road specific events
    - [ ] Design "Exotic Goods Discovery" event
      - [ ] Trigger for counties directly on Silk Road main route
      - [ ] Use trade_good_discovered_trigger from trade systems
      - [ ] Create special opinion modifiers with foreign merchants
      - [ ] Add prestige and small wealth benefits
      - [ ] Include cultural flavor for goods origin
    - [ ] Implement "Silk Road Disruption" event
      - [ ] Trigger from county occupation on main route
      - [ ] Create notification for players about economic impact
      - [ ] Show temporary prosperity penalties
      - [ ] Add strategic options for rulers to respond
      - [ ] Include diplomatic actions against disrupting parties
    - [ ] Create "Cultural Exchange" event chain
      - [ ] Focus on minimal innovation spread mechanics
      - [ ] Use existing culture scope and relation systems
      - [ ] Add minor acceptance bonuses between trade partners
      - [ ] Include options for embracing or rejecting foreign influences
      - [ ] Create trait-based outcomes affecting character opinions
    - [ ] Add "Trade Route Security" event
      - [ ] Trigger from counties with active trade but low control
      - [ ] Present options for investing in route protection
      - [ ] Create risk/reward decisions for military investment
      - [ ] Add outcomes affecting county control and prosperity
    - [ ] Use on_action hooks for key trigger points (occupation, peace treaty)
    - [ ] Implement localization in `localization/english/silk_road_events_l_english.yml`
    - [ ] Create Silk Road specific event pictures
    - [ ] Ensure compatibility with Northern Lords if present

- [ ] **Basic Tutorial Elements** - Essential guidance for new players
  - [ ] Create `events/mvp_trade_tutorial.txt` for basic tutorial events
    - [ ] Design "Introduction to Trade" event
      - [ ] Trigger on first game month for player with trade routes
      - [ ] Create clear explanation of basic mechanics
      - [ ] Add guidance for accessing trade interface
      - [ ] Use hint system to point to key interface elements
      - [ ] Include option to disable further tutorials
    - [ ] Implement "Trade Buildings Guide" event
      - [ ] Trigger when player can build first trade building
      - [ ] Explain building benefits and requirements
      - [ ] Add visual guidance for building placement
      - [ ] Create small reward for completing first building
    - [ ] Create "Trade Policies Introduction" event
      - [ ] Trigger when player reaches appropriate realm size
      - [ ] Explain policy options and trade-offs
      - [ ] Add guidance for decision menu navigation
      - [ ] Use helper tooltips for explaining policy impacts
    - [ ] Implement "Trade Prosperity Notification" event
      - [ ] Trigger when county first reaches trade prosperity
      - [ ] Explain prosperity benefits and mechanics
      - [ ] Add visual indicators for prosperity levels
      - [ ] Create tips for maintaining trade flow
    - [ ] Create tutorial-specific tooltips with extended information
    - [ ] Use existing hint system for interface guidance
    - [ ] Implement skip option for experienced players
    - [ ] Add tutorial-specific graphics for clarity
  - [ ] Create `gui/trade_tutorial_widget.gui` for helper overlays
    - [ ] Design unobtrusive UI elements for pointing out features
    - [ ] Create expandable help panels for detailed explanations
    - [ ] Implement dismiss and "don't show again" options
    - [ ] Use vanilla UI framework for consistent appearance
  - [ ] Add detailed tutorial text in `localization/english/trade_tutorial_l_english.yml`
    - [ ] Create straightforward explanations of mechanics
    - [ ] Add contextual tips for different play styles
    - [ ] Include historical flavor about medieval trade
    - [ ] Ensure readability and accessibility in language

This MVP focuses on establishing the Silk Road with basic mechanics, allowing players to:

1. Build trade-focused buildings
2. Experience prosperity effects from trade activity
3. Make simple trade policy decisions
4. Interact with a limited set of merchant characters
5. Visualize trade routes on the map

More complex systems like Merchant Organizations, Religious Trade, River Trade, Maritime Innovations, Trade Technology and Explorer Mechanics will be developed after the MVP is complete.

## 2. Core Trade System Framework

### 2.1 Trade System Values and Constants

- [ ] Create `common/script_values/trade_values.txt` for global constants
  - [ ] Define base trade good values (luxury, common, regional)
  - [ ] Define trade route value multipliers based on distance
  - [ ] Set prosperity threshold values (low, medium, high)
  - [ ] Establish AI behavior weights for trade decisions
  - [ ] Define trade building value calculations
  - [ ] Create script calculation methods compatible with GetValue and ScriptValue APIs

### 2.2 Trade Route System

- [ ] Create `common/trade_routes/` folder for route definitions
  - [ ] Implement route data structure with id, name, and nodes
  - [ ] Define land_routes and sea_routes connections between nodes
  - [ ] Add historical route information for flavor
  - [ ] Create dynamic route status flags (active, disrupted, prosperous)
  - [ ] Set up base values and throughput capacity for each route
  - [ ] Implement special route conditions (seasonal, dangerous, profitable)
  - [ ] Create compatibility layer with travel_plan scope

### 2.3 Trade Node System

- [ ] Create `common/trade_nodes/` folder for node definitions
  - [ ] Define node data structure with province linking
  - [ ] Implement controller scope for dynamic ownership
  - [ ] Create value calculation system based on local modifiers
  - [ ] Set up node specializations (production, transit, market)
  - [ ] Add historical node information for major trading centers
  - [ ] Create connection rules between nodes (land, river, sea)
  - [ ] Implement integration with existing county system

### 2.4 Trade Good Framework

- [ ] Create `common/trade_goods/` folder for tradable commodities
  - [ ] Implement good categories (luxury, common, regional)
  - [ ] Define production rules based on terrain and buildings
  - [ ] Create consumption desire rules for characters and courts
  - [ ] Set up scarcity and abundance modifiers
  - [ ] Implement special good effects (cultural significance, religious uses)
  - [ ] Create seasonality effects for certain goods
  - [ ] Use existing luxury good localizations (silk, spiced_wine, etc.)

### 2.5 Trade Triggers and Conditions

- [ ] Create `common/scripted_triggers/trade_triggers.txt` for condition checks
  - [ ] Implement `can_build_trade_building_trigger` for building prerequisites
  - [ ] Create `is_on_active_trade_route_trigger` for county checks
  - [ ] Add `has_profitable_trade_goods_trigger` for production checks
  - [ ] Implement `can_establish_trade_agreement_trigger` for character interactions
  - [ ] Create `is_trade_route_disrupted_trigger` for route status checks
  - [ ] Add `has_trade_prosperity_trigger` with multiple levels
  - [ ] Ensure compatibility with standard trigger structure conventions

### 2.6 Trade Effects and Actions

- [ ] Create `common/scripted_effects/trade_effects.txt` for trade actions
  - [ ] Implement `setup_trade_route_effect` for route initialization
  - [ ] Create `calculate_trade_income_effect` for economic impact
  - [ ] Add `apply_trade_opinion_effect` for character relations
  - [ ] Implement `destroy_trade_route_effect` for route disruption
  - [ ] Create `trade_cultural_exchange_effect` for innovation spread
  - [ ] Add `apply_trade_prosperity_effect` with county modifications
  - [ ] Follow standard effect formatting and scope manipulation

### 2.7 Trade Calculation System

- [ ] Create `common/scripted_effects/trade_calculation_effects.txt` for core algorithms
  - [ ] Implement monthly flow calculation algorithm
  - [ ] Create node value determination system
  - [ ] Add good distribution and pricing mechanisms
  - [ ] Implement route efficiency calculations based on control
  - [ ] Create prosperity level determination
  - [ ] Add character wealth generation from trade
  - [ ] Optimize for efficient monthly pulse execution

### 2.8 On-Action Hooks

- [ ] Create `common/on_action/trade_on_actions.txt` for trade event hooks
  - [ ] Hook into `on_monthly_pulse` for trade calculations
  - [ ] Add `on_county_occupied` hook for route disruption
  - [ ] Implement `on_realm_law_changed` for trade policy updates
  - [ ] Create `on_character_travel_start` hooks for caravan events
  - [ ] Add `on_holding_building_constructed` for trade building effects
  - [ ] Implement `on_culture_era_changed` for new goods unlocking
  - [ ] Add compatibility with `fp1_trade_events_cycle` and `fp1_trade_events_random`
  - [ ] Create hooks for major historical disruptions (like Black Death)
  - [ ] Add `on_realm_split` hook for empire fragmentation effects
  - [ ] Implement `on_game_year_change` hook for historical progression

### 2.9 Trade Variables and Flags

- [ ] Create `common/script_values/trade_variables.txt` for state tracking
  - [ ] Implement global trade network state variables
  - [ ] Create county-level trade activity tracking
  - [ ] Add character trade participation metrics
  - [ ] Implement realm trade policy state
  - [ ] Create trade agreement status tracking
  - [ ] Add trade route disruption flags
  - [ ] Use standard variable naming conventions for compatibility

### 2.10 Trade Modifiers

- [ ] Create `common/modifiers/trade_modifiers.txt` for gameplay effects
  - [ ] Implement county trade value modifiers
  - [ ] Create character trade income multipliers
  - [ ] Add building trade efficiency bonuses
  - [ ] Implement cultural trade acceptance modifiers
  - [ ] Create trade route throughput adjustments
  - [ ] Add special trade good bonuses
  - [ ] Leverage existing modifiers like monthly_income_mult and development_growth_factor

### 2.11 Merchant Organizations

- [ ] Create `common/merchant_guilds/` folder for organization definitions
  - [ ] Implement Hanseatic League structure
  - [ ] Define Italian merchant houses (Medici, etc.)
  - [ ] Create Middle Eastern merchant networks
  - [ ] Set up organization power calculation
  - [ ] Create inter-organization rivalry system
  - [ ] Implement guild master character generation
  - [ ] Define ruler-guild relation framework
  - [ ] Create guild influence mechanics in counties
  - [ ] Set up autonomous guild actions independent of ruler control
  - [ ] Add era-appropriate availability restrictions (Hanseatic League c. 1356)

### 2.12 Religious Trade System

- [ ] Create `common/scripted_effects/religious_trade_effects.txt` for religious trade mechanics
  - [ ] Implement pilgrimage-trade overlap mechanics
  - [ ] Create religious trade centers (Jerusalem, Mecca, Rome)
  - [ ] Add faith restrictions on trade interactions
  - [ ] Implement religious order trade benefits
  - [ ] Create faith-based trade good price modifiers
  - [ ] Add holy site trade bonuses
  - [ ] Implement religious diplomatic modifiers for trade

### 2.13 River Trade System

- [ ] Create `common/river_trade_routes/` folder for river trade definitions
  - [ ] Define major historical river trade routes (Dnieper, Volga, Nile, etc.)
  - [ ] Create specialized river port building types
  - [ ] Implement seasonal effects on river trade (freezing, floods)
  - [ ] Add piracy and toll mechanics for river routes
  - [ ] Create river trade control mechanics
  - [ ] Implement special terrain bonuses for river trade
  - [ ] Add river-specific trade goods and specializations

### 2.14 Maritime Innovation System

- [ ] Create `common/trade_technologies/maritime_innovations.txt` for naval technologies
  - [ ] Define progression of maritime technologies (compass, shipbuilding, etc.)
  - [ ] Create discovery and spread mechanics for innovations
  - [ ] Implement effects of maritime technologies on trade
  - [ ] Add character knowledge requirements for technologies
  - [ ] Create discovery events framework
  - [ ] Implement era-specific maritime capabilities
  - [ ] Add regional specialization in naval technologies
  - [ ] Create historically accurate timing for major innovations (magnetic compass c. 1100-1200)
  - [ ] Implement knowledge diffusion from advanced to less advanced regions

### 2.15 Trade Technology System

- [ ] Create `common/trade_technologies/financial_innovations.txt` for economic innovations
  - [ ] Define financial instruments (bills of exchange, banking, etc.)
  - [ ] Create merchant-banking mechanics
  - [ ] Implement currency and exchange systems
  - [ ] Add long-distance trade facilitation mechanics
  - [ ] Create character education requirements for financial knowledge
  - [ ] Implement technology spread through trade routes
  - [ ] Add specialized character roles for financial innovations
  - [ ] Implement historical year restrictions for advanced banking (bills of exchange c. 1150+)
  - [ ] Add regional early unlock for Italian city-states
  - [ ] Create progressive unlocking system for financial instruments by era

### 2.16 Empire Peace Effects System

- [ ] Create `common/scripted_effects/trade_peace_effects.txt` for empire stability mechanics
  - [ ] Implement "Pax Mongolica" style trade safety bonuses for large stable realms
  - [ ] Create trade route safety calculations based on political stability
  - [ ] Add empire fragmentation penalties to trade
  - [ ] Implement civil war and succession crisis trade disruptions
  - [ ] Create special caravan protection mechanics for large realms
  - [ ] Add diplomatic relation modifiers based on shared trade benefits
  - [ ] Implement trade recovery after major political shifts
  - [ ] Add era-appropriate empire effects (Pax Mongolica c. 1250-1350)

## 3. Silk Road Implementation

- [ ] Create `common/trade_routes/silk_road.txt` defining main route
- [ ] Create `common/trade_routes/silk_road_branches.txt` for secondary routes
- [ ] Create `common/trade_nodes/` folder for trade junction definitions
  - [ ] Create `common/trade_nodes/eastern_nodes.txt` (China, Central Asia)
  - [ ] Create `common/trade_nodes/middle_eastern_nodes.txt` (Persia, Mesopotamia)
  - [ ] Create `common/trade_nodes/european_nodes.txt` (Constantinople, Venice, etc.)
- [ ] Create `common/province_modifiers/trade_province_modifiers.txt` for route bonuses

## 4. Trade Goods

- [ ] Create `common/trade_goods/luxury_goods.txt` (silk, spices, jade, etc.)
- [ ] Create `common/trade_goods/common_goods.txt` (grain, timber, metals, etc.)
- [ ] Create `common/trade_goods/regional_goods.txt` (area-specific goods)
- [ ] Create `localization/english/trade_goods_l_english.yml` for goods descriptions
- [ ] Create `gfx/interface/icons/goods/` folder with individual icons for each good

## 5. Trade Buildings

- [ ] Create `common/buildings/trade_buildings.txt` for:
  - [ ] Caravanserais
  - [ ] Trading posts
  - [ ] Warehouses
  - [ ] Market squares
  - [ ] Toll stations
  - [ ] Guild halls
  - [ ] Trade fair grounds
  - [ ] River ports
  - [ ] Caravan outfitting centers
  - [ ] Banking houses (historically locked until 1100+ for Italian regions, 1200+ for others)
  - [ ] Merchant quarters
- [ ] Create `gfx/interface/icons/buildings/` for building icons
- [ ] Create `localization/english/trade_buildings_l_english.yml` for building descriptions
- [ ] Implement hooks into the on_holding_building_constructed on-action

## 6. Character Mechanics

- [ ] Create `common/traits/trade_traits.txt` for merchant/trader traits
- [ ] Create `common/character_interactions/trade_interactions.txt` for:
  - [ ] Establish relations with merchant guilds
  - [ ] Invest in trade venture
  - [ ] Sabotage rival's trade
  - [ ] Hire merchant advisors
  - [ ] Grant trade privileges to guilds
  - [ ] Negotiate with guild masters
- [ ] Create `common/decisions/trade_decisions.txt` for character trade choices
- [ ] Integrate with existing character scope and AI behavior systems

## 7. Events

- [ ] Create `events/trade_events.txt` for generic trade events
- [ ] Create `events/silk_road_events.txt` for Silk Road specific events:
  - [ ] Merchant caravan arrival
  - [ ] Trade disputes
  - [ ] Exotic goods discovery
  - [ ] Trade delegation
- [ ] Create `events/cultural_exchange_events.txt` for cross-cultural encounters
- [ ] Create `events/trade_crisis_events.txt` for disruptions and opportunities
- [ ] Create `localization/english/trade_events_l_english.yml` for event texts
- [ ] Use travel_plan scope for caravan-related events

## 8. Trade Fair System

- [ ] Create `common/activities/trade_fair.txt` for trade fair framework
- [ ] Create `events/trade_fair_events.txt` for Champagne-style trade fair events:
  - [ ] Fair preparation events
  - [ ] Merchant arrival events
  - [ ] Negotiations and deals events
  - [ ] Cultural exchange during fairs
  - [ ] Disputes and resolution events
  - [ ] Fair conclusion events
- [ ] Create `common/modifiers/trade_fair_modifiers.txt` for temporary effects
- [ ] Create `decisions/host_trade_fair_decision.txt` for initiating fairs
- [ ] Create `gfx/interface/illustrations/events/trade_fair/` for event images
- [ ] Implement hooks into activity system similar to feasts and hunts
- [ ] Add historical restrictions (Champagne fairs begin c. 1150)

## 9. Merchant Republic System

- [ ] Create `common/government_types/merchant_republic_types.txt` for republic framework
- [ ] Create `common/succession_laws/merchant_republic_succession.txt` for unique succession
- [ ] Create `common/buildings/merchant_republic_buildings.txt` for special buildings
- [ ] Create `events/merchant_republic_events.txt` for republic-specific events:
  - [ ] Patrician family competition
  - [ ] Trading post establishment
  - [ ] Electoral campaign events
  - [ ] Republic vs feudal tensions
- [ ] Create `common/scripted_effects/merchant_republic_effects.txt` for mechanics
- [ ] Create `decisions/merchant_republic_decisions.txt` for unique decisions
- [ ] Implement special modifiers for Venice, Genoa, and other historic republics

## 10. Explorer Mechanics System

- [ ] Create `common/character_interactions/explorer_interactions.txt` for expeditions
  - [ ] Implement sponsor trade expedition interaction
  - [ ] Create explorer character generation
  - [ ] Add expedition risk/reward calculations
  - [ ] Implement knowledge transfer mechanics
  - [ ] Add historical restrictions (no long expeditions before 1100)
  - [ ] Create regional distance limits for different periods
  - [ ] Implement "Marco Polo" style far expeditions only after 1200
- [ ] Create `events/explorer_events.txt` for journey events:
  - [ ] Expedition preparation events
  - [ ] Journey challenges and discoveries
  - [ ] Return and knowledge sharing
  - [ ] New trade route establishment
  - [ ] Era-appropriate discoveries and encounters
- [ ] Create `common/artifacts/explorer_artifacts.txt` for exotic goods
- [ ] Create `common/modifiers/explorer_modifiers.txt` for character bonuses
- [ ] Implement framework for historical journeys (Marco Polo, Ibn Battuta)
- [ ] Create historically accurate destination possibilities by era

## 11. Regional Trade Networks

- [ ] Create `common/scripted_effects/regional_trade_effects.txt` for region-specific rules
  - [ ] Implement Viking trade network (Baltic and North Seas)
  - [ ] Create Abbasid commercial system (Baghdad, Basra)
  - [ ] Add Samanid Silk Road segment mechanics
  - [ ] Implement Indian Ocean trade system
  - [ ] Create Song Dynasty maritime network rules
  - [ ] Add West African gold trade mechanics
  - [ ] Implement Mediterranean trade basin effects
- [ ] Create `common/trade_regions/` folder for regional definitions
- [ ] Create `localization/english/trade_regions_l_english.yml` for region descriptions
- [ ] Implement regional trade goods specialization

## 12. Trade Modifiers

- [ ] Create `common/modifier_icons/trade_modifier_icons.txt` for UI display
- [ ] Create `gfx/interface/icons/modifiers/` folder for modifier icons
- [ ] Ensure compatibility with existing economic modifiers

## 13. GUI Elements

- [ ] Create `gui/trade_window.gui` for main trade interface
- [ ] Create `gui/trade_route_mapmode.gui` for trade route visualization
- [ ] Create `gui/trade_tooltips.gui` for enhanced information display
- [ ] Create `gui/merchant_guilds_window.gui` for guild interactions
- [ ] Create `gui/trade_fair_window.gui` for fair management
- [ ] Create `gui/explorer_journey_window.gui` for expedition tracking
- [ ] Create `gui/river_trade_mapmode.gui` for river trade visualization
- [ ] Create `gfx/interface/illustrations/trade/` folder for event pictures
- [ ] Extend the existing economy map mode functionality

## 14. Mercantile Lifestyle

- [ ] Create `common/lifestyle_focuses/trade_focuses.txt` for merchant focus options
- [ ] Create `common/lifestyle_perks/trade_perks.txt` for trade-related perks
- [ ] Create `events/lifestyle/trade_lifestyle_events.txt` for merchant events
- [ ] Create `localization/english/trade_lifestyle_l_english.yml` for text
- [ ] Integrate with existing stewardship lifestyle

## 15. Special Features

- [ ] Create `common/trade_policies/` folder for realm trade policies
- [ ] Create `common/merchant_companies/` folder for merchant organization mechanics
- [ ] Create `common/scripted_effects/silk_road_disruption_effects.txt` for route interruptions
- [ ] Create `common/scripted_triggers/trade_prosperity_triggers.txt` for prosperity mechanics
- [ ] Create `common/on_action/historical_trade_events.txt` for era-based event triggers
- [ ] Implement dynamic trade shift system for major historical changes

## 16. Trade-Focused Decisions

- [ ] Create `common/decisions/trade_route_decisions.txt` for:
  - [ ] Establish new trade post
  - [ ] Protect trade route
  - [ ] Fund caravan expedition
  - [ ] Host trade fair
  - [ ] Grant merchant privileges
  - [ ] Establish relations with merchant guilds
  - [ ] Sponsor explorer journey
  - [ ] Establish river trade route
  - [ ] Adopt financial innovation
  - [ ] Secure maritime trade route
- [ ] Create `localization/english/trade_decisions_l_english.yml` for decision texts
- [ ] Add historical restrictions to advanced decisions

## 17. Northern Lords Integration

- [ ] Examine existing fp1_trade_events_cycle and fp1_trade_events_random contents
- [ ] Create `events/northern_lords_trade_events.txt` for compatible events
- [ ] Add trade mechanics for viking raiders and merchants
- [ ] Create northern-specific trade goods and routes
- [ ] Implement compatibility with Northern Lords adventure and pillage tracks
- [ ] Create event handlers for Northern Lords flavor pack trade on-actions
- [ ] Implement specialized Viking merchant adventurer mechanics
- [ ] Add Kievan Rus river route framework for Viking-Byzantine trade

## 19. Documentation and Testing

- [ ] Create `documentation/` folder with implementation notes
- [ ] Create `documentation/trade_system.md` explaining core systems
- [ ] Create `documentation/modding_guide.md` for future expansion
- [ ] Create `playtesting/scenarios.md` with test cases
- [ ] Document API integration and compatibility details
- [ ] Create historical accuracy notes for reference
- [ ] Document historical restrictions and progression

## 20. Integration and Balance

- [ ] Create `common/game_rules/trade_game_rules.txt` for configurable options
- [ ] Create `common/script_values/trade_balance_values.txt` for easy adjustment
- [ ] Create `common/on_action/trade_integration_on_actions.txt` for vanilla compatibility
- [ ] Implement graceful degradation for missing DLCs
- [ ] Create compatibility flags for tracking game version support
- [ ] Implement toggle options for historical vs. sandbox play
- [ ] Add game rule for disabling historical restrictions for sandbox play

## 21. Tutorial and Guidance System

### 21.1 Tutorial Framework

- [ ] Create `events/trade_tutorial_events.txt` for progressive tutorial system
  - [ ] Implement initial trade introduction event
  - [ ] Create separate tutorial chains for each major system
  - [ ] Add era transition tutorial events
  - [ ] Implement complexity progression based on player experience
- [ ] Create `gui/trade_tutorial_window.gui` for tutorial UI
  - [ ] Design clean, intuitive tutorial window
  - [ ] Implement expandable/collapsible information sections
  - [ ] Add interactive elements for hands-on learning
  - [ ] Create progress tracking system

### 21.2 Context-Sensitive Help

- [ ] Create `common/scripted_triggers/tutorial_eligibility_triggers.txt` for help targeting
  - [ ] Implement context detection for player situation
  - [ ] Create triggers for determining appropriate tutorial level
  - [ ] Add triggers for detecting player difficulties
- [ ] Add info icons to all trade interface elements
  - [ ] Design hoverable help icons with extended tooltips
  - [ ] Create layered information display (basic → advanced)
  - [ ] Implement tooltip hints system for mechanics explanations

### 21.3 Trade Advisor System

- [ ] Create `common/character_interactions/advisor_interactions.txt` for trade guidance
  - [ ] Implement "Ask about trade" interaction
  - [ ] Create "Request trade advice" interaction
  - [ ] Add specialized advice for different trade aspects
- [ ] Create `events/trade_advisor_events.txt` for advisor responses
  - [ ] Implement contextual advice based on realm situation
  - [ ] Create trait-influenced advisor personalities
  - [ ] Add cultural and regional variations to advice

### 21.4 Guided Tasks System

- [ ] Create `common/decisions/tutorial_trade_decisions.txt` for learning tasks
  - [ ] Design simple starter trade tasks
  - [ ] Create progressive difficulty system
  - [ ] Implement reward system for completion
- [ ] Create `gui/trade_guide_window.gui` for reference encyclopedia
  - [ ] Design comprehensive trade reference guide
  - [ ] Implement searchable interface
  - [ ] Create visual aids and examples
  - [ ] Add historical context information

### 21.5 Complexity Management

- [ ] Create `common/game_rules/tutorial_game_rules.txt` for customization
  - [ ] Implement tutorial frequency setting
  - [ ] Create complexity level options
  - [ ] Add toggles for specific tutorial elements
- [ ] Create `gui/trade_interface_complexity.gui` for interface adjustments
  - [ ] Design basic/advanced toggle system
  - [ ] Implement information density controls
  - [ ] Create quick reference panel for essential information

## 22. Visual Feedback System

### 22.1 Map Visualization

- [ ] Create `gui/mapmode_trade.gui` for trade map mode
  - [ ] Implement color coding for trade prosperity
  - [ ] Design trade route visualization system
  - [ ] Create node specialization icons
  - [ ] Add visual indicators for disrupted routes
- [ ] Create `gfx/interface/icons/map_icons/trade_nodes/` for node representation
  - [ ] Design icons for different node specializations
  - [ ] Create prosperity level indicators
  - [ ] Implement active/inactive state visuals
  - [ ] Add historical node type visuals

### 22.2 UI Enhancement

- [ ] Create `gui/trade_window_enhanced.gui` for detailed trade interface
  - [ ] Design trade flow diagram component
  - [ ] Implement prosperity meter visuals
  - [ ] Create route health indicator system
  - [ ] Design income breakdown visual components
  - [ ] Implement interactive network visualization
- [ ] Create `gfx/interface/illustrations/trade_states/` for status visuals
  - [ ] Design prosperity level illustrations
  - [ ] Create route status indicator graphics
  - [ ] Add trade good flow visuals
  - [ ] Implement income/loss visualization

### 22.3 Animation and Effects

- [ ] Create `gui/map_objects/trade_caravans.gui` for route animation
  - [ ] Design caravan movement animation
  - [ ] Implement dynamic speed based on route efficiency
  - [ ] Create ship animation for sea routes
  - [ ] Add variation based on goods transported
- [ ] Create `gfx/map/trade_prosperity_effects/` for county effects
  - [ ] Design visual effects for high prosperity counties
  - [ ] Create subtle animation for active trade
  - [ ] Implement era transition visual effects
  - [ ] Add building activity indicators

### 22.4 Visual Accessibility

- [ ] Create `common/script_values/visual_accessibility_options.txt` for settings
  - [ ] Implement color-blind mode alternatives
  - [ ] Create scale factors for visual elements
  - [ ] Add simplified view option variables
  - [ ] Design theme selection system
- [ ] Create `gui/trade_settings_window.gui` for visual customization
  - [ ] Design accessibility settings panel
  - [ ] Implement preview system for options
  - [ ] Create presets for common visual preferences
  - [ ] Add detailed control over visual complexity

### 22.5 Notification System

- [ ] Create `gui/trade_notifications.gui` for trade alerts
  - [ ] Design notification appearance hierarchy
  - [ ] Implement color coding for notification types
  - [ ] Create interactive notification response
  - [ ] Add options for notification filtering
- [ ] Implement sound effects for trade events
  - [ ] Create sounds for prosperity changes
  - [ ] Add audio cues for route disruption
  - [ ] Design ambient sounds for high trade activity
  - [ ] Implement audio alerts for significant events

## 23. AI Trade Behavior System

### 23.1 AI Evaluation Framework

- [ ] Create `common/scripted_effects/trade_ai_evaluation_effects.txt` for decision logic
  - [ ] Implement building investment evaluation
  - [ ] Create route development priority system
  - [ ] Add character interaction decision logic
  - [ ] Design trade policy selection criteria
  - [ ] Implement risk-reward evaluation for expeditions
- [ ] Create `common/scripted_triggers/trade_ai_opportunity_triggers.txt` for detection
  - [ ] Design triggers for identifying profitable trade opportunities
  - [ ] Create detection for threatened trade routes
  - [ ] Implement triggers for optimal building placement
  - [ ] Add trader character recruitment opportunities

### 23.2 AI Strategy Profiles

- [ ] Create `common/ai_strategies/trade_strategies.txt` for behavior patterns
  - [ ] Implement merchant focus strategies (aggressive, diplomatic, monopolist)
  - [ ] Create balanced focus strategies (pragmatist, opportunist, developer)
  - [ ] Add minimal focus strategies (isolationist, reactive, exploiter)
  - [ ] Design strategy selection based on character traits and realm
- [ ] Create `common/scripted_modifiers/ai_strategy_selection_modifiers.txt` for weights
  - [ ] Implement trait influence on strategy selection
  - [ ] Create realm situation modifiers for strategy
  - [ ] Add regional and cultural strategy biases

### 23.3 Character Trait System

- [ ] Create `common/scripted_effects/trade_trait_behavior_effects.txt` for personality
  - [ ] Implement greedy character behavior patterns
  - [ ] Create ambitious character long-term planning
  - [ ] Add trait-based preference for trade goods
  - [ ] Design education level influence on trade competence
  - [ ] Implement cultural background effects on trade behavior
- [ ] Add trade-specific AI values to existing traits
  - [ ] Update trait definitions with trade behavior modifiers
  - [ ] Create trade aptitude values for education traits
  - [ ] Add trade risk tolerance based on traits
  - [ ] Implement diplomatic approach variations by trait

### 23.4 Dynamic Adaptation

- [ ] Create `common/scripted_effects/trade_ai_adaptation_effects.txt` for responsive behavior
  - [ ] Implement economic state responsive behavior
  - [ ] Create threat response system for trade
  - [ ] Add cultural context adaptation
  - [ ] Design historical adjustment
  - [ ] Implement learning from player behavior
- [ ] Create `common/on_action/trade_ai_reassessment_on_actions.txt` for triggers
  - [ ] Add periodic strategy reassessment
  - [ ] Create event-triggered reevaluation
  - [ ] Implement critical situation response
  - [ ] Add competitive response to player actions

### 23.5 AI Feedback System

- [ ] Create `gui/ai_intention_indicators.gui` for transparency
  - [ ] Design AI strategy hint system
  - [ ] Implement reaction prediction tooltips
  - [ ] Create AI intention reveal interface
  - [ ] Add decision logic explanation system
- [ ] Create `events/trade_intelligence_events.txt` for discoveries
  - [ ] Implement events to learn rival strategies
  - [ ] Create merchant informant system
  - [ ] Add diplomatic intelligence on trade plans
  - [ ] Design espionage for trade information

### 23.6 Optimization

- [ ] Create `common/script_values/ai_performance_values.txt` for processing allocation
  - [ ] Define evaluation frequency based on importance
  - [ ] Implement caching duration and conditions
  - [ ] Create AI processing priority levels
  - [ ] Design proximity-to-player scaling factors
- [ ] Implement performance profiling and optimization tools
  - [ ] Create debug logging for AI trade decisions
  - [ ] Implement performance monitoring
  - [ ] Add adaptive processing allocation
  - [ ] Create compatibility with vanilla AI optimization techniques
