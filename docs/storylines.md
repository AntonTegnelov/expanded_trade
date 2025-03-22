# Trade Storyline Events

This document outlines the historical trade storylines to be implemented as event chains in the Expanded Trade mod.

## 1. Early Medieval Trade Networks (9th-10th Century)

### 1.1 Viking Trade Expansion (9th Century)

- **File Location**: `events/northern_lords_trade_events.txt`
- **API Usage**:
  - Leverage `fp1_trade_events_cycle` and `fp1_trade_events_random` for Northern Lords compatibility
  - Use `travel_plan` scope for Viking merchant journeys
  - Utilize `county` and `character` scopes for trade interactions

**Event Chain Summary**:

1. **"Merchant Opportunities Beyond Raiding"** - Initial event for Norse rulers to establish trade focus alongside raiding
2. **"Establishing a Trading Post"** - Decision-triggered event to create trade centers like Birka or Kaupang
3. **"Eastern Connections"** - Event for Norse merchants establishing routes to Byzantium through river systems
4. **"Northern Silver, Eastern Luxuries"** - Trade exchange events showcasing cultural goods exchange
5. **"The Rus Connection"** - Event connecting to the Kievan Rus storyline when both are active

**Related Systems**:

- Hooks into `common/buildings/trade_buildings.txt` for Norse trading posts
- Uses `common/decisions/trade_route_decisions.txt` for establishing Viking trade routes
- Connects to the River Trade System for the journey from Scandinavia to Byzantium

### 1.2 Establishment of Kievan Rus as a Trade Hub (c. 882)

- **File Location**: `events/river_trade_events.txt`
- **API Usage**:
  - River route system using `travel_plan` scope
  - Culture and religion triggers for Slavic, Norse, and Byzantine interactions
  - County development modifiers for river settlements

**Event Chain Summary**:

1. **"The Path from Varangians to Greeks"** - Establishing the Dnieper river route
2. **"Founding of Kiev"** - Special event for characters controlling the Kiev province
3. **"Byzantine Emissaries"** - Diplomatic event with Byzantine trade representatives
4. **"Cultural Exchange"** - Events for spreading innovations along the river routes
5. **"Northern Relations"** - Cross-storyline event with Viking traders when applicable

**Related Systems**:

- Uses `common/river_trade_routes/dnieper_route.txt` for route definition
- Integrates with cultural exchange mechanics for innovation spread
- Connects to Byzantine trade systems for southern route connections

### 1.3 Flourishing of Islamic Trade under the Abbasids (9th Century)

- **File Location**: `events/islamic_trade_events.txt`
- **API Usage**:
  - Religion scopes for Islamic rulers
  - Province modifiers for Baghdad and Basra
  - Character interaction system for scholars and merchants

**Event Chain Summary**:

1. **"The Round City's Markets"** - Special event for rulers of Baghdad
2. **"House of Wisdom"** - Events combining scholarship and trade
3. **"Indian Ocean Connections"** - Maritime trade events linking to southern routes
4. **"The Baghdad-Chang'an Connection"** - Silk Road trade events showing East-West connections
5. **"Cultural Golden Age"** - Events showcasing how trade fuels cultural development

**Related Systems**:

- Uses `common/trade_nodes/middle_eastern_nodes.txt` for Baghdad, Basra, and Samarra
- Connects to `common/trade_goods/luxury_goods.txt` for specialized Islamic-world goods
- Integrates with religious trade system for pilgrimages and religious connections

### 1.4 Samanid Empire's Promotion of Silk Road Trade (9th-10th Centuries)

- **File Location**: `events/silk_road_events.txt`
- **API Usage**:
  - Trade route mechanics for Silk Road segments
  - Culture triggers for Persian and Central Asian cultures
  - County prosperity system for Samanid territories

**Event Chain Summary**:

1. **"Persian Renaissance"** - Cultural flourishing through trade event
2. **"Securing the Eastern Route"** - Events for stabilizing the Silk Road
3. **"Samarkand's Rise"** - Special events for the Samarkand trade node
4. **"Paper and Knowledge"** - Events for the spread of papermaking and other innovations
5. **"Diplomatic Exchange"** - Cross-cultural events with Chinese, Turkic, and Islamic rulers

**Related Systems**:

- Uses `common/trade_routes/silk_road.txt` central sections
- Integrates with Cultural Exchange Mechanics for innovation spread
- Connects with `common/trade_goods/luxury_goods.txt` for silk and paper trade

### 1.5 Expansion of the Indian Ocean Trade Network (From the 9th Century Onward)

- **File Location**: `events/maritime_trade_events.txt`
- **API Usage**:
  - Seasonal mechanics for monsoon winds
  - Sea route system for Indian Ocean connections
  - Cultural exchange triggers for Arabian, Indian, and East African interactions

**Event Chain Summary**:

1. **"Monsoon Winds"** - Events tied to seasonal trading opportunities
2. **"Spice Islands Expedition"** - Events for establishing trade with Southeast Asia
3. **"East African Gold"** - Events connecting to Swahili coast trade
4. **"Arabian Seafarers"** - Events for Arab merchants dominating oceanic trade
5. **"Fusion of Traditions"** - Cultural blending events in major port cities

**Related Systems**:

- Uses `common/maritime_innovations.txt` for navigation technologies
- Connects to `common/regional_trade_networks/indian_ocean.txt` for route definitions
- Integrates with seasonal effects system for monsoon-dependent trade timing

### 1.6 Maritime Innovations and Trade in the Song Dynasty (960-1279)

- **File Location**: `events/maritime_innovations_events.txt`
- **API Usage**:
  - Technology discovery system for maritime innovations
  - Character education for naval knowledge
  - Province modifiers for Chinese coastal provinces

**Event Chain Summary**:

1. **"The Magnetic Compass"** - Introduction and spread of compass technology (c. 1100-1200)
2. **"Shipbuilding Advances"** - Events for developing superior vessels
3. **"Southern Seas Expansion"** - Events for Song Dynasty maritime trade growth
4. **"Maritime Silk Road"** - Events connecting sea routes to traditional Silk Road
5. **"Knowledge Transfer"** - Events for spreading maritime technologies westward

**Related Systems**:

- Uses `common/trade_technologies/maritime_innovations.txt` for technology progression
- Connects to `common/trade_routes/maritime_silk_road.txt` for sea routes
- Includes historical restrictions for when technologies become available

## 2. High Medieval Trade Development (11th-13th Centuries)

### 2.1 The Crusades and Their Impact on Mediterranean Trade (1096-1291)

- **File Location**: `events/crusade_trade_events.txt`
- **API Usage**:
  - Crusade mechanics integration
  - Religious tensions system for interfaith trade
  - Character interactions for crusader states and merchants

**Event Chain Summary**:

1. **"Eastern Luxuries"** - Events showcasing European exposure to exotic goods
2. **"Crusader State Commerce"** - Events for trade in Jerusalem, Antioch, etc.
3. **"Italian Merchants in the Holy Land"** - Events connecting to Italian maritime republics
4. **"Military Orders as Trade Protectors"** - Events for Templars/Hospitallers securing routes
5. **"Cultural Transmission"** - Events for European adoption of Eastern practices

**Related Systems**:

- Integrates with existing crusade mechanics
- Uses `common/religious_trade_system.txt` for interfaith commerce
- Connects to Italian Maritime Republics storyline

### 2.2 Growth of the Champagne Fairs (12th-13th Centuries)

- **File Location**: `events/trade_fair_events.txt`
- **API Usage**:
  - Activity system similar to feasts and hunts
  - Character interaction system for merchant negotiations
  - Province modifiers for fair locations

**Event Chain Summary**:

1. **"Establishing the Fair Cycle"** - Events for creating regional fair rotation (after c. 1150)
2. **"Merchant Gathering"** - Events for participants arriving from different regions
3. **"Commercial Negotiations"** - Events for trade deals and contracts
4. **"Banking Innovation"** - Events introducing financial instruments
5. **"Fair Politics"** - Events for rulers using fairs for diplomatic purposes

**Related Systems**:

- Uses `common/activities/trade_fair.txt` framework
- Connects to `common/decisions/host_trade_fair_decision.txt`
- Integrates with trade technology system for financial innovations
- Includes historical restrictions (only available after c. 1150)

### 2.3 Medieval European Commercial Revolution (12th-14th Centuries)

- **File Location**: `events/trade_technology_events.txt`
- **API Usage**:
  - Innovation spread mechanics
  - Character education for financial knowledge
  - Modified dynasty mechanics for merchant families

**Event Chain Summary**:

1. **"Bills of Exchange"** - Introduction of financial instruments (after c. 1150)
2. **"Banking Houses"** - Events for establishing banking institutions
3. **"Credit Systems"** - Events for long-distance trade financing
4. **"Merchant Education"** - Events for training in commercial mathematics
5. **"Commercial Law Development"** - Events for establishing trade regulations

**Related Systems**:

- Uses `common/trade_technologies/financial_innovations.txt`
- Connects to building system for banking houses
- Includes historical restrictions (advanced banking after c. 1150, first in Italian regions)

### 2.4 Rise of the Mongol Empire and the Pax Mongolica (1206-1368)

- **File Location**: `events/silk_road_events.txt`
- **API Usage**:
  - Empire peace effects system
  - Trade route security mechanics
  - Cultural exchange between East and West

**Event Chain Summary**:

1. **"Unification of the Steppes"** - Initial Mongol conquest effects on trade
2. **"The Secure Road"** - Events for increased safety on the Silk Road (c. 1250-1350)
3. **"East-West Exchange"** - Events for cultural and technological transmission
4. **"Imperial Messengers"** - Events for the Yam postal system facilitating trade
5. **"Decline of Security"** - Events for the breakdown of the Pax Mongolica

**Related Systems**:

- Uses `common/scripted_effects/trade_peace_effects.txt`
- Connects to Silk Road main route system
- Includes historical restrictions (Pax Mongolica effects only c. 1250-1350)

### 2.5 Marco Polo's Travels (1271-1295)

- **File Location**: `events/explorer_events.txt`
- **API Usage**:
  - Character journey system
  - Knowledge discovery mechanics
  - Court storytelling for returning explorers

**Event Chain Summary**:

1. **"Venetian Merchants Eastward"** - Initial expedition events
2. **"At the Court of Kublai Khan"** - Events for European-Mongol interactions
3. **"Recording the Wonders"** - Events for documenting Eastern trade practices
4. **"Return to Venice"** - Events for returning with knowledge and goods
5. **"The Book of the Marvels"** - Events for spreading knowledge throughout Europe

**Related Systems**:

- Uses `common/character_interactions/explorer_interactions.txt`
- Connects to Royal Court DLC for court artifacts and storytelling
- Includes historical restrictions (only possible after c. 1270)

### 2.6 Dominance of Italian Maritime Republics (11th-15th Centuries)

- **File Location**: `events/merchant_republic_events.txt`
- **API Usage**:
  - Republic government type mechanics
  - Trade post system for Mediterranean colonies
  - Naval combat for trade protection

**Event Chain Summary**:

1. **"Rise of the Maritime Powers"** - Events for Venice and Genoa's growth
2. **"Eastern Trading Posts"** - Events for establishing colonial outposts
3. **"Commercial Rivalry"** - Events for Venice-Genoa competition
4. **"Patrician Families"** - Internal politics events affecting trade
5. **"Naval Dominance"** - Events for securing sea routes through naval power

**Related Systems**:

- Uses `common/government_types/merchant_republic_types.txt`
- Connects to `common/succession_laws/merchant_republic_succession.txt`
- Integrates with buildings system for republic-specific structures

## 3. Late Medieval Trade Developments (14th-15th Centuries)

### 3.1 Formation of the Hanseatic League (c. 1356)

- **File Location**: `events/merchant_guilds_events.txt`
- **API Usage**:
  - Merchant organization system
  - Multi-realm alliance mechanics
  - Trade policy interactions

**Event Chain Summary**:

1. **"The Hanseatic Charter"** - League formation events (after c. 1356)
2. **"League Kontors"** - Events for establishing trading posts
3. **"Standardized Trade Practices"** - Events for commercial regulations
4. **"League Diplomacy"** - Events for collective bargaining with rulers
5. **"Naval Protection"** - Events for securing Baltic and North Sea routes

**Related Systems**:

- Uses `common/merchant_guilds/hanseatic_league.txt`
- Connects to Northern European trade networks
- Includes historical restrictions (only after c. 1356)

### 3.2 Disruption of Trade by the Black Death (1347-1351)

- **File Location**: `events/trade_crisis_events.txt`
- **API Usage**:
  - Disease mechanics integration
  - Trade route disruption system
  - Population and development impacts

**Event Chain Summary**:

1. **"Arrival of the Plague"** - Initial disease spread through trade routes
2. **"Commercial Shutdown"** - Events for route closures and quarantines
3. **"Price Revolution"** - Events for economic impacts of population loss
4. **"Trade Route Shifts"** - Events for adapting to new commercial realities
5. **"Recovery and Adaptation"** - Events for post-plague trade restructuring

**Related Systems**:

- Integrates with vanilla disease mechanics
- Uses `common/scripted_effects/trade_disruption_effects.txt`
- Affects all trade routes and prosperity systems

### 3.3 Mansa Musa's Pilgrimage to Mecca (c. 1324)

- **File Location**: `events/religious_trade_events.txt`
- **API Usage**:
  - Religious pilgrimage mechanics
  - Gold as trade good for trans-Saharan routes
  - Diplomatic opinion modifiers for displays of wealth

**Event Chain Summary**:

1. **"The Golden Hajj"** - Events for West African ruler's pilgrimage
2. **"Gold Price Collapse"** - Economic impact events in Cairo and beyond
3. **"African-Arab Connections"** - Trade relationship events
4. **"Return to Mali"** - Events for bringing Middle Eastern scholars and merchants
5. **"Tales of African Gold"** - Events for changing perception of West Africa

**Related Systems**:

- Uses `common/religious_trade_system.txt` for pilgrimage routes
- Connects to `common/regional_trade_networks/west_african.txt`
- Integrates pilgrimage and trade mechanics

### 3.4 Venetian Dominance in Post-Fourth Crusade Constantinople (After 1204)

- **File Location**: `events/merchant_republic_events.txt`
- **API Usage**:
  - Crusade mechanics integration
  - Trade privileges system
  - Colony management for trading quarters

**Event Chain Summary**:

1. **"The Partition of Romania"** - Events for Venetian gains after 1204
2. **"Controlling the Straits"** - Events for dominating Black Sea access
3. **"Trade Privileges in Constantinople"** - Events for special commercial rights
4. **"Rivalry with Genoa"** - Competitive events with other Italian powers
5. **"Legacy of Commercial Empire"** - Long-term impact events

**Related Systems**:

- Connects to crusade mechanics and merchant republic system
- Uses `common/buildings/merchant_republic_buildings.txt` for quarters
- Integrates with Byzantine regional trade network

### 3.5 Portuguese Capture of Ceuta (1415)

- **File Location**: `events/explorer_events.txt`
- **API Usage**:
  - War outcome triggers
  - Trade route control mechanics
  - Colonial mechanics for early outposts

**Event Chain Summary**:

1. **"Gateway to Africa"** - Events for capturing the trade hub
2. **"Disrupting the Caravan Routes"** - Events affecting trans-Saharan trade
3. **"Atlantic Ambitions"** - Events foreshadowing maritime exploration
4. **"Knowledge of African Waters"** - Events for gaining navigation information
5. **"The Hunt for New Routes"** - Events connecting to later exploration

**Related Systems**:

- Uses conquest system for capturing the trade node
- Connects to `common/trade_routes/african_routes.txt`
- Sets up later Age of Discovery elements

### 3.6 Prince Henry the Navigator's Navigational School at Sagres (Early 15th Century)

- **File Location**: `events/maritime_innovations_events.txt`
- **API Usage**:
  - Character education for navigation
  - Innovation discovery system
  - Maritime technology progression

**Event Chain Summary**:

1. **"The School of Sagres"** - Establishment of navigation research
2. **"Cartographic Advances"** - Events for map-making improvements
3. **"Ship Design Innovation"** - Events for developing the caravel
4. **"Systematic Exploration"** - Events for methodical coastline mapping
5. **"Foundations for Discovery"** - Events setting up later exploration

**Related Systems**:

- Uses `common/trade_technologies/maritime_innovations.txt`
- Connects to character education system
- Leads to exploration mechanics development

### 3.7 Timur's Conquests and the Reconfiguration of Silk Road Trade (Late 14th Century)

- **File Location**: `events/silk_road_events.txt`
- **API Usage**:
  - War impact system on trade routes
  - Route disruption and reconfiguration mechanics
  - Cultural patronage by conquerors

**Event Chain Summary**:

1. **"Conquest and Destruction"** - Events for initial trade disruption
2. **"Samarkand's Glory"** - Events for Timur's capital as new trade center
3. **"Route Shifts"** - Events for merchants finding alternative paths
4. **"Timurid Patronage"** - Events for cultural sponsorship through trade wealth
5. **"New Commercial Equilibrium"** - Events for adjusted trade patterns

**Related Systems**:

- Uses `common/scripted_effects/silk_road_disruption_effects.txt`
- Connects to Silk Road main route system
- Integrates with conquest mechanics for trade impact

## 4. Cross-Storyline Integration

- **Dynamic Trade Flow Adjustments**: System to adjust trade prosperity and flow based on active storylines
- **Cultural Exchange Framework**: System for tracking innovations and goods spreading between active storylines
- **Religious Trade Network**: Integration of pilgrimage routes with commercial routes across storylines
- **Historical Period Triggers**: On-action hooks for triggering appropriate storylines based on game year
- **Geographic Region Activation**: System to enable relevant storylines based on player location and interests

## 5. Implementation Priorities

1. **MVP Storylines**:

   - Viking Trade Expansion
   - Silk Road core events (Samanid and Mongol periods)
   - Islamic Trade under Abbasids
   - Italian Maritime Republics

2. **Secondary Implementation**:

   - Kievan Rus Trade Hub
   - Crusades Impact
   - Medieval Commercial Revolution
   - Indian Ocean Trade Network

3. **Advanced Features**:
   - Hanseatic League
   - Black Death Disruption
   - Explorer Mechanics (Marco Polo, Portuguese exploration)
   - Late medieval developments
