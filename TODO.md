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

- [x] **Character Interaction Refactoring** - Replace direct control with character-driven interactions

  - [x] Remove direct "Establish Trade Agreement" interaction

    - [x] Adjust documentation explaining preference of indirect control over trade rather than direct control
    - [x] remove existing interaction code
    - [x] Update any dependent effects or events
    - [x] Remove localization entries from trade_interactions_l_english.yml
    - [x] Update tutorial text that references this interaction

  - [x] Implement "Host Foreign Merchants" character interaction
    - [x] Use category = diplomatic for proper UI placement
    - [x] Create invitation mechanism for foreign merchant characters
    - [x] Implement ongoing trade benefits that scale based on merchant skills
    - [x] Add events for cultural exchanges, conflicts, and relationships
    - [x] Create trait-based outcomes reflecting ruler personality
    - [x] Design opinion modifiers with foreign rulers based on treatment of their merchants
    - [x] Implement compatibility with vanilla interaction framework
    - [x] Create appropriate interaction icon
    - [x] Add localization in trade_interactions_l_english.yml

- [x] **Trade Policy Decisions** - Simple realm-wide policies

  - [x] Create `common/decisions/trade_policy_decisions.txt` with basic policy options
    - [x] Implement "Court Trade Focus" council task
      - [x] Create `common/council_tasks/trade_council_tasks.txt` for the Steward
      - [x] Design event chain reflecting character traits and culture
      - [x] Create different outcomes based on ruler traits (greedy, just, ambitious)
      - [x] Implement ongoing modifiers while task is active
      - [x] Add random events that can fire while task is assigned
      - [x] Use existing council task framework for compatibility
      - [x] Create appropriate task icon in gfx/interface/icons/council_tasks/
      - [x] Add localization in trade_council_tasks_l_english.yml
    - [x] Design "Secure Trade Route" decision for protecting specific routes
      - [x] Use is_shown that requires county on silk road and ruler control
      - [x] Set cost = { gold = 250 prestige = 150 }
      - [x] Create effects that reduce disruption chance and increase trade prosperity
      - [x] Add time_to_complete = { days = 180 } for balance
      - [x] Set ai_will_do based on county's trade value and realm wealth
    - [x] Create "Promote Luxury Goods" decision for increasing high-end goods
      - [x] Add is_shown requiring specific goods production in realm
      - [x] Set cost = { gold = 200 prestige = 100 }
      - [x] Create effects boosting specific trade good value for duration
      - [x] Set cooldown = { days = 3650 } (10 years)
      - [x] Use ai_will_do weighted by stewardship and appropriate traits
    - [x] Use existing decision framework for compatibility
    - [x] Create custom_tooltip fields for clear player feedback
    - [x] Add appropriate icons in `gfx/interface/icons/decisions/`
    - [x] Implement localization in `localization/english/trade_decisions_l_english.yml`

- [x] **Trade route Interface** - Basic map mode and information display
  - [x] Create `gui/trade_mapmode.gui` for trade route visualization
    - [x] Implement basic map mode showing trade routes with different colors
    - [x] Create map objects for trade nodes using existing map system
    - [x] Design route visualization with three states (prosperous, normal, disrupted)
    - [x] Use vanilla map_modes.gui structure for compatibility
    - [x] Implement tooltips showing route state and prosperity
    - [x] Create node tooltips showing goods and value
    - [x] Add trade map mode button to existing map mode selection panel
  - [x] Create `gui/trade_window.gui` for detailed trade information
    - [x] Design main trade info window following vanilla window patterns
    - [x] Create tabs for Routes, Goods, and Policies
    - [x] Implement route list showing status and value of each route section
    - [x] Design goods list showing production and value in realm
    - [x] Add current policies section showing active trade decisions
    - [x] Create basic realm trade summary with income breakdown
    - [x] Use vanilla widget templates for consistency (similar to economy window)
  - [x] Create `gui/widgets/trade_tooltips.gui` for enhanced information display
    - [x] Design county tooltip extension showing trade information
    - [x] Create character tooltip extension for merchant characters
    - [x] Implement holding tooltip additions for trade buildings
    - [x] Use vanilla tooltip framework (DefaultTooltipWidget)
  - [x] Reuse existing graphics from base game assets
    - [x] Use vanilla icons for routes, nodes, goods and all interface elements
    - [x] Leverage vanilla window backgrounds and frame elements
    - [x] Repurpose existing status icons for prosperity and disruption indicators
  - [x] Implement localization in `localization/english/trade_interface_l_english.yml`
    - [x] Add map mode name and description
    - [x] Create tooltip text for all interface elements
    - [x] Add heading and label text for windows
    - [x] Include help text for new players

### Events and Content

- [x] **Basic Trade Events** - Simple events for trade activity

  - [x] Create `events/trade_events.txt` for general trade events
    - [x] Implement "Trade Caravan Arrival" event
      - [x] Use type = character_event for ruler interaction
      - [x] Set trigger = { owns_county_with_trade_route_trigger = yes }
      - [x] Create monthly_province_pulse_chance = { base = 1 }
      - [x] Add options for accepting goods with wealth/prestige gains
      - [x] Include options for turning away merchants with opinion consequences
      - [x] Create ai_chance calculations based on traits and realm needs
    - [x] Design "Local Goods Price Fluctuation" event
      - [x] Use type = province_event for county-specific impact
      - [x] Create seasonal triggers for appropriate timing
      - [x] Add multiple outcomes based on trade good type
      - [x] Implement temporary county modifier application
      - [x] Set appropriate cooldown = { days = 365 }
    - [x] Create "Merchant Dispute" event
      - [x] Use type = character_event with involved_characters = { scope:merchant }
      - [x] Generate random merchant character using generate_trader_effect
      - [x] Add diplomatic resolution options with skill checks
      - [x] Create options for justice versus profit with trait implications
      - [x] Set appropriate opinion modifiers for outcomes
    - [x] Implement simple economic events without advanced mechanics
    - [x] Ensure hooks into existing on_action triggers for event firing
    - [x] Keep event chains short (3-5 events maximum) for MVP
    - [x] Use standard event system formatting and structure
    - [x] Select appropriate vanilla event illustrations from the base game

- [x] **Silk Road Events** - Limited set of events for the main trade route

  - [x] Design "Exotic Goods Discovery" event
    - [x] Trigger for counties directly on Silk Road main route
    - [x] Use trade_good_discovered_trigger from trade systems
    - [x] Create special opinion modifiers with foreign merchants
    - [x] Add prestige and small wealth benefits
    - [x] Include cultural flavor for goods origin
  - [x] Implement "Silk Road Disruption" event
    - [x] Trigger from county occupation on main route
    - [x] Create notification for players about economic impact
    - [x] Show temporary prosperity penalties
    - [x] Add strategic options for rulers to respond
    - [x] Include diplomatic actions against disrupting parties
  - [x] Create "Cultural Exchange" event chain
    - [x] Focus on minimal innovation spread mechanics
    - [x] Use existing culture scope and relation systems
    - [x] Add minor acceptance bonuses between trade partners
    - [x] Include options for embracing or rejecting foreign influences
    - [x] Create trait-based outcomes affecting character opinions
  - [x] Add "Trade Route Security" event
    - [x] Trigger from counties with active trade but low control
    - [x] Present options for investing in route protection
    - [x] Create risk/reward decisions for military investment
    - [x] Add outcomes affecting county control and prosperity
    - [x] Use on_action hooks for key trigger points (occupation, peace treaty)
    - [x] Implement localization in `localization/english/silk_road_events_l_english.yml`
    - [x] Map events to appropriate vanilla event themes and backgrounds
    - [x] Ensure compatibility with Northern Lords if present

## 1B. Tutorial System Refactoring

- [x] **Remove Event-Based Tutorial Approach** - Fix the incorrect implementation

  - [x] Delete `events/trade_tutorial.txt` file
    - [x] Remove on_action hooks for tutorial events
    - [x] Remove character flags for tutorial progress tracking
  - [x] Remove any references to tutorial events from other files
    - [x] Clean up localization files of tutorial event texts
    - [x] Remove any interface elements specific to tutorial events
  - [x] Audit other files for tutorial event dependencies
    - [x] Check on_action files for tutorial event triggers
    - [x] Verify no decisions or interactions depend on tutorial events

- [ ] **Implement Proper Tutorial System** - Use CK3's native tutorial framework

  - [x] Create `common/tutorial_lessons/trade_tutorial_lessons.txt`
    - [x] Define lesson chain for trade mechanics
    - [x] Create structured lessons with proper GUI transitions
    - [x] Implement widget highlighting for UI elements
    - [x] Add appropriate effects and triggers for progression
    - [x] Use encapsulated states with proper animation
  - [x] Create `common/tutorial_lesson_chains/trade_lesson_chains.txt`
    - [x] Define progression of lesson chains
    - [x] Set proper prerequisites using existing lesson chains
    - [x] Configure save_progress_in_gamestate settings
  - [x] Create `common/important_actions/trade_reactive_advice.txt`
    - [x] Implement reactive advice for trade situations
    - [ ] Set appropriate triggers for when advice should appear
    - [ ] Connect to lesson system with start_tutorial_lesson
  - [ ] Update localization files for tutorial content
    - [ ] Create `localization/english/trade_tutorial_lessons_l_english.yml`
    - [ ] Add detailed lesson text with appropriate formatting
    - [ ] Include button text and headers
  - [ ] Create appropriate hooks into vanilla tutorial system
    - [ ] Ensure compatibility with existing tutorial progression
    - [ ] Respect player's tutorial settings

- [ ] **Guided Tutorial Elements** - Essential player guidance using proper tutorial system
  - [ ] Create basic trade lesson chain in `common/tutorial_lesson_chains/trade_lesson_chains.txt`
    - [ ] Set appropriate prerequisites with vanilla tutorial chains
    - [ ] Configure save_progress_in_gamestate flags
    - [ ] Set proper trigger conditions for availability
  - [ ] Implement core trade lessons in `common/tutorial_lessons/trade_tutorial_lessons.txt`
    - [ ] Create "Introduction to Trade" lesson
      - [ ] Implement highlight_widget for trade map mode and UI elements
      - [ ] Add GUI transitions with proper button_id elements
      - [ ] Include animation = center for main tutorial window
      - [ ] Set force_pause_game = yes for critical information
    - [ ] Design "Trade Buildings Guide" lesson
      - [ ] Add widget highlighting for building menu
      - [ ] Include progressive step structure with header_info
      - [ ] Create trigger_transition elements for building construction
      - [ ] Add appropriate effects with small rewards for completion
    - [ ] Add "Trade Policies" lesson
      - [ ] Create highlight_widget for policy decision menu
      - [ ] Add GUI transitions to guide through policy selection
      - [ ] Include button_text elements for clear navigation
      - [ ] Set appropriate enabled conditions for progression
    - [ ] Implement "Trade Prosperity" lesson
      - [ ] Create widget highlights for prosperity indicators
      - [ ] Add illustrations of prosperity mechanics
      - [ ] Include step-by-step guidance on prosperity management
      - [ ] Configure proper shown_in_encyclopedia flags
  - [ ] Create reactive advice in `common/important_actions/trade_reactive_advice.txt`
    - [ ] Implement "First Trade Building" advice
      - [ ] Set appropriate check_create_action conditions
      - [ ] Configure soundeffect for notification
      - [ ] Connect to proper tutorial lesson
    - [ ] Add "Trade Route Disruption" advice
      - [ ] Set triggers for when trade routes become disrupted
      - [ ] Create appropriate icon and notification
      - [ ] Link to helpful tutorial lesson
    - [ ] Design "Trade Prosperity Achieved" advice
      - [ ] Configure conditions for first prosperity milestone
      - [ ] Set up congratulatory notification
      - [ ] Connect to prosperity management lesson
  - [ ] Add comprehensive localization in `localization/english/trade_tutorial_lessons_l_english.yml`
    - [ ] Create clear lesson text with proper formatting
    - [ ] Add button labels with descriptive text
    - [ ] Include header information for all tutorial steps
    - [ ] Create tooltips for highlighted widgets
  - [ ] Ensure perfect compatibility with vanilla tutorial system
    - [ ] Test integration with existing tutorial progression
    - [ ] Verify respect for tutorial settings
    - [ ] Confirm proper encyclopedia entries
    - [ ] Validate all widget highlighting functions

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
- [ ] Reuse existing inventory or artifact icons from vanilla game for all goods

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
- [ ] Reuse appropriate existing building icons from vanilla game
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
- [ ] Use existing event illustrations from vanilla game - NO custom art
- [ ] Implement hooks into activity system similar to feasts and hunts
- [ ] Add historical restrictions (Champagne fairs begin c. 1150)

## 9. Merchant Republic System

- [ ] Create `common/government_types/merchant_republic_types.txt` for republic framework
- [ ] Create `common/succession_laws/merchant_republic_succession.txt` for unique succession
- [ ] Create `common/buildings/merchant_republic_buildings.txt`
