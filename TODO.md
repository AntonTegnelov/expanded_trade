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
    - [x] Implement compatibility with travel_plan scope from base game (requires game integration)

- [x] **Trade Node System** - Essential trade hubs with simple connection rules

  - [x] Create `common/trade_nodes/silk_road_nodes.txt` with key trade centers
    - [x] Define core node data structure with county/province connections
    - [x] Implement basic controller scope using existing county owner mechanics
    - [x] Create simple value calculation using existing development level (requires game integration)
    - [x] Limit to essential nodes (Constantinople, Baghdad, Samarkand, etc.)
    - [x] Use existing county system for node placement
    - [x] Implement straightforward node connection rules leveraging adjacency (requires game integration)
    - [x] Ensure compatibility with existing province system using province_id references (requires game integration)

- [x] **Trade Good Distribution** - Limited set of luxury and common goods

  - [x] Create `common/trade_goods/trade_goods.txt` with basic goods
    - [x] Implement core good categories (luxury, common) with minimal types
    - [x] Define basic production rules based on vanilla terrain types
    - [x] Create simple consumption rules using existing character scope
    - [x] Limit to essential goods (silk, spices, fur, metals, etc.)
    - [x] Leverage existing terrain and building systems for production placement
    - [x] Use vanilla localization for luxury goods where available
    - [x] Ensure compatibility with county terrain_type checks for production

- [x] **Trade Flow Calculation** - Simple monthly calculations without advanced modifiers

  - [x] Create `common/scripted_effects/trade_calculation_effects.txt` with core algorithms
    - [x] Implement simplified monthly flow calculation effect
    - [x] Create basic node value determination based on development and goods
    - [x] Add simple goods distribution that follows route connections
    - [x] Create route efficiency calculation based on county control
    - [x] Implement hooks into on_monthly_pulse for regular updates
    - [x] Use existing scope system for efficient calculation
    - [x] Ensure compatibility with GetValue and ScriptValue API

- [x] **Trade Prosperity Effects** - Basic development and income bonuses

  - [x] Create `common/modifiers/trade_prosperity_modifiers.txt` for county effects
    - [x] Implement tiered prosperity levels (low, medium, high)
    - [x] Create basic development_growth_factor modifiers (0.1, 0.2, 0.3)
    - [x] Add simple tax_mult and monthly_income modifiers
    - [x] Implement monthly_county_control_contribution for trade-active counties
    - [x] Use existing modifier system for application
    - [x] Ensure compatibility with development system using development_growth_factor
    - [x] Create hooks with county scope for scripted triggers

- [x] **Trade Triggers and Conditions** - Essential checks for trade functionality

  - [x] Create `common/scripted_triggers/trade_triggers.txt` for basic conditions
    - [x] Implement `is_on_silk_road_trigger` for county checks
    - [x] Create `has_trade_good_trigger` for production verification
    - [x] Add `has_trade_prosperity_trigger` with basic levels
    - [x] Implement `can_build_trade_building_trigger` for prerequisites
    - [x] Ensure compatibility with standard trigger structure
    - [x] Use existing county scope and terrain checks
    - [x] Leverage province adjacency system for route proximity checks

- [x] **Trade Effects and Actions** - Core effects for basic trade operations

  - [x] Create `common/scripted_effects/trade_effects.txt` for essential actions
    - [x] Implement `setup_silk_road_effect` for initial configuration
    - [x] Create `calculate_basic_trade_income_effect` for financial impact
    - [x] Add `apply_trade_prosperity_effect` for county modifiers
    - [x] Implement `disrupt_trade_route_effect` for war impacts
    - [x] Follow standard effect format with clear scope expectations
    - [x] Use existing county and character scope manipulation
    - [x] Ensure compatibility with modifier application system

- [x] **On-Action Hooks** - Minimal integration with game events

  - [x] Create `common/on_action/trade_on_actions.txt` for essential hooks
    - [x] Hook into `on_monthly_pulse` for trade calculations
    - [x] Add `on_county_occupied` for route disruption
    - [x] Implement `on_holding_building_constructed` for trade building effects
    - [x] Create basic integration with `fp1_trade_events_random` if Northern Lords exists
    - [x] Use standard on_action structure for compatibility
    - [x] Implement basic event triggers for trade status changes
    - [x] Ensure performance optimization with minimal monthly checks

- [x] **Trade Variables and Flags** - Essential state tracking

  - [x] Create `common/script_values/trade_variables.txt` for core state tracking
    - [x] Implement global silk_road_status variable
    - [x] Create county_trade_prosperity_level for local tracking
    - [x] Add character_trade_participation for ruler engagement
    - [x] Implement trade_route_disruption flags for war impacts
    - [x] Use standard variable naming conventions
    - [x] Ensure compatibility with save/load system
    - [x] Leverage existing flag system for state tracking

- [x] **Trade Modifiers** - Basic modifiers for county and character effects
  - [x] Create `common/modifiers/trade_modifiers.txt` for core gameplay effects
    - [x] Implement county_trade_value modifier for local prosperity
    - [x] Create character_trade_income_mult for ruler benefits
    - [x] Add building_trade_value_add for infrastructure bonuses
    - [x] Implement trade_route_throughput for route quality
    - [x] Use existing modifier system for integration
    - [x] Ensure compatibility with monthly_income_mult and similar vanilla modifiers
    - [x] Create icons for trade-specific modifiers

### Player Interaction

- [x] **Trade Buildings** - Essential infrastructure (markets, trading posts, caravanserais)

  - [x] Create `common/buildings/trade_buildings.txt` with core buildings
    - [x] Design Market Square building for city holdings
      - [x] Set gold_cost = 100 and build_time = 200
      - [x] Add county_trade_value_add = 0.5 and tax_mult = 0.05
      - [x] Use existing building system prerequisites (requires city_buildings_01)
    - [x] Design Trading Post building for tribal and castle holdings
      - [x] Set gold_cost = 150 and build_time = 300
      - [x] Add county_trade_value_add = 0.75 and monthly_income = 0.2
      - [x] Require county to be on trade route using is_on_silk_road_trigger
    - [x] Design Caravanserai building for counties on major routes
      - [x] Set gold_cost = 200 and build_time = 365
      - [x] Add county_trade_value_add = 1 and development_growth_factor = 0.1
      - [x] Implement special_building_slot = trade_post_slot for key locations
    - [x] Ensure building upgrades follow vanilla pattern (level 1, 2, 3)
    - [x] Use appropriate building flags for UI display (construction_category = economic)
    - [x] Balance costs and benefits against vanilla economic buildings
    - [x] Create appropriate building unlock conditions using scripted triggers

- [x] **Merchant Character Interactions** - Basic set of character actions

  - [x] Create `common/character_interactions/trade_interactions.txt` with essential interactions
    - [x] Implement "Invite Merchant" interaction
      - [x] Use category = diplomatic for proper UI placement
      - [x] Implement is_shown using has_appropriate_rank_trigger from vanilla
      - [x] Create on_accept effect to generate merchant character (uses generate_character effect)
      - [x] Set cooldown = { days = 365 } for balance
      - [x] Use ai_accept system with wealth and personality factors
    - [x] Design "Establish Trade Agreement" interaction between rulers
      - [x] Use category = diplomatic for proper UI placement
      - [x] Add cost = { gold = 150 prestige = 100 } for balance
      - [x] Create on_accept effect that boosts relations and trade (modify_opinion and set_variable)
      - [x] Add ai_accept calculation based on opinion, distance, and existing trade activity
      - [x] Implement scope validation using has_independent_realm_trigger or similar
    - [x] Create "Sponsor Trade Expedition" interaction for increasing trade flow
      - [x] Use category = diplomatic for proper UI placement
      - [x] Set cost = { gold = 100 prestige = 50 }
      - [x] Create on_accept effect to improve trade flow on specific route
      - [x] Add ai_will_do based on stewardship and ambitious trait
      - [x] Create event chain for success/failure using random_events_weight system
    - [x] Ensure compatibility with vanilla interaction framework
      - [x] Use standard category and scopes
      - [x] Follow vanilla pattern for all properties
    - [x] Create proper interaction icons in `gfx/interface/icons/character_interactions/`
      - [x] For MVP, use existing game icons (invite_to_court, alliance, and travel)
    - [x] Add appropriate tooltip localizations in `localization/english/trade_interactions_l_english.yml`

- [ ] **Character Interaction Refactoring** - Replace direct control with character-driven interactions

  - [x] Remove direct "Establish Trade Agreement" interaction

    - [x] Adjust documentation explaining preference of indirect control over trade rather than direct control
    - [x] remove existing interaction code
    - [x] Update any dependent effects or events
    - [x] Remove localization entries from trade_interactions_l_english.yml
    - [x] Update tutorial text that references this interaction

  - [ ] Implement "Host Foreign Merchants" character interaction
    - [ ] Use category = diplomatic for proper UI placement
    - [ ] Create invitation mechanism for foreign merchant characters
    - [ ] Implement ongoing trade benefits that scale based on merchant skills
    - [ ] Add events for cultural exchanges, conflicts, and relationships
    - [ ] Create trait-based outcomes reflecting ruler personality
    - [ ] Design opinion modifiers with foreign rulers based on treatment of their merchants
    - [ ] Implement compatibility with vanilla interaction framework
    - [ ] Create appropriate interaction icon
    - [ ] Add localization in trade_interactions_l_english.yml

- [ ] **Trade Policy Decisions** - Simple realm-wide policies

  - [ ] Create `common/decisions/trade_policy_decisions.txt` with basic policy options
    - [ ] Implement "Court Trade Focus" council task
      - [ ] Create `common/council_tasks/trade_council_tasks.txt` for the Steward
      - [ ] Design event chain reflecting character traits and culture
      - [ ] Create different outcomes based on ruler traits (greedy, just, ambitious)
      - [x] Implement ongoing modifiers while task is active
      - [x] Add random events that can fire while task is assigned
      - [x] Use existing council task framework for compatibility
      - [ ] Create appropriate task icon in gfx/interface/icons/council_tasks/
      - [x] Add localization in trade_council_tasks_l_english.yml
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

- [ ] **Trade route Interface** - Basic map mode and information display
  - [ ] Create `gui/trade_mapmode.gui` for trade route visualization
    - [ ] Implement basic map mode showing trade routes with different colors
    - [ ] Create map objects for trade nodes using existing map system
    - [ ] Design route visualization with three states (prosperous, normal, disrupted)
    - [ ] Use vanilla map_modes.gui structure for compatibility
    - [ ] Implement tooltips showing route state and prosperity
    - [ ] Create node tooltips showing goods and value
    - [ ] Add trade map mode button to existing map mode selection panel
  - [ ] Create `gui/trade_window.gui` for detailed trade information
    - [ ] Design main trade info window following vanilla window patterns
    - [ ] Create tabs for Routes, Goods, and Policies
    - [ ] Implement route list showing status and value of each route section
    - [ ] Design goods list showing production and value in realm
    - [ ] Add current policies section showing active trade decisions
    - [ ] Create basic realm trade summary with income breakdown
    - [ ] Use vanilla widget templates for consistency (similar to economy window)
  - [ ] Create `gui/widgets/trade_tooltips.gui` for enhanced information display
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

  - [ ] Create `events/trade_events.txt` for general trade events
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
  - [ ] Create `events/trade_tutorial.txt` for basic tutorial events
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
  - [ ] Add `has_profitable_trade_goods_trigger`
