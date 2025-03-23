# Game Design Concept

## Working title

Expanded Trade

## Concept statement

Adds advanced trade system, among them simulating the silk road. Gives plenty of opportunities for player characters to interact.

## Player Experience and Mod POV

Adding advanced and dynamic trade to CK3 pleases both hardcore map painters and the character-focused players.

The setting expands on the historical trade networks of the medieval world, with special emphasis on the Silk Road connecting Europe to China. The fantasy granted to players is becoming a powerful merchant ruler who can influence regional and continental economies through trade decisions and policies.

Players should feel:

- Accomplishment when establishing profitable trade networks
- Intrigue when manipulating trade for political advantage
- Cultural enrichment through interactions with distant lands
- Tension when trade routes are threatened
- Satisfaction from seeing their dynasty prosper through merchant activities

Player engagement is maintained through:

- Dynamic trade events that respond to the changing political landscape
- Character-focused trade interactions that create memorable stories
- Gradual unlocking of more valuable trade goods and routes as their influence grows
- Competing objectives between maximizing trade profit and other feudal concerns

## Artistic Direction

This mod will leverage existing art assets from the base game as much as possible. No custom art will be created unless absolutely necessary, and in those rare cases, only minimal art assets will be developed. The mod will:

- Repurpose existing event backgrounds for trade-related events
- Use vanilla icons and UI elements for trade interfaces
- Adapt existing map overlays and markers for trade routes
- Utilize standard building icons for trade structures
- Reuse existing character portraits and clothing for merchant characters

This approach ensures compatibility with the base game aesthetic while focusing development resources on gameplay systems rather than visual assets.

## Core Loops

The primary gameplay loops include:

1. **Investment Loop**:

   - Player invests resources into trade infrastructure
   - Infrastructure improves flow of goods
   - Increased trade provides income and prestige
   - New opportunities for investment appear

2. **Control Loop**:

   - Player expands control of trade nodes
   - Control increases influence over neighboring realms
   - Influence creates diplomatic opportunities
   - Diplomatic success allows further expansion

3. **Character Interaction Loop**:
   - Trade brings characters from distant cultures into contact
   - These interactions create events and decisions
   - Decisions impact character relationships and traits
   - New relationship dynamics create further events

These loops are engaging because they blend economic strategy with character narrative. They support player goals by providing alternative paths to power beyond military conquest. Emergent gameplay should include trading dynasties rising to prominence, cultural fusion along trade routes, and economic interdependence creating new political alliances.

## Objectives and Progression

Short-term goals for players include:

- Building initial trade infrastructure in their home territory
- Establishing trade connections with neighboring realms
- Acquiring trait bonuses related to mercantile activities
- Managing local rivalries over trade routes

Long-term goals include:

- Controlling major segments of the Silk Road
- Establishing trade monopolies on luxury goods
- Creating a mercantile empire spanning multiple realms
- Becoming the wealthiest dynasty in the known world
- Influencing distant cultures through trade connections

Progression occurs through:

- Gradual expansion of controlled trade nodes
- Development of increasingly specialized trade buildings
- Character development through trade-related events and decisions
- Acquisition of exotic goods that provide unique bonuses
- Formation of trade policies that shape realm development

These objectives support the mod concept by keeping the focus on character stories while providing the strategic depth that map-painters enjoy. The fantasy of being a merchant ruler is reinforced by having both economic and political goals tied to trade success.

## Game Systems

The mod requires the following systems:

### Internal (Simulation) Systems:

1. **Trade Route Network** - Defines physical connections between trade nodes across the map

   - Leverages county connections and de jure borders to establish natural trade flows
   - Integrates with existing travel systems to represent merchant caravans using the travel mechanics
   - Respects geographical features like rivers, mountain passes and sea routes that already affect military movement

2. **Trade Good Distribution** - Determines what goods are produced where and their value

   - Tied to county terrain types, development levels, and existing building types
   - Special resources correspond to known historical production centers
   - Production affected by county control level, with hostile occupation disrupting production

3. **Trade Flow Calculation** - Simulates movement of goods along routes based on conditions

   - Routes can be disrupted by wars, sieges, and realm hostility
   - Flow efficiency affected by development level and county control
   - Piracy and raiding impact naval trade routes, synergizing with raiding mechanics

4. **Trade Prosperity Effects** - Calculates how trade impacts province development over time

   - Integrates with the development system, providing modifiers to development growth
   - Counties with active trade gain bonus development rate similar to development focus
   - Synergizes with stewardship lifestyle and corresponding council tasks

5. **Cultural Exchange Mechanics** - Tracks how ideas and innovations spread along trade routes

   - Accelerates innovation spread between cultures connected by active trade
   - Integrates with cultural acceptance mechanics, with trade improving acceptance
   - Facilitates new hybrid cultures in major trading hubs

6. **Merchant Organization System** - Simulates semi-autonomous merchant guilds and leagues

   - Organizations like the Hanseatic League operate across realm boundaries
   - Merchant guilds form in major trading cities with limited ruler control
   - Organizations have their own interests, sometimes aligned with rulers, sometimes not
   - Rulers can influence but not directly control these organizations
   - Organizations appear historically (Hanseatic League only after ~1350)

7. **Religious Trade System** - Connects religious practices with trade networks

   - Pilgrimage routes double as trade routes with seasonal bonuses
   - Religious restrictions affect trade between different faiths
   - Religious orders participate in and regulate trade
   - Holy sites serve as special trade centers with unique goods

8. **River Trade System** - Specializes in riverine commerce and navigation

   - Major river routes like the Dnieper, Volga, and Nile have unique mechanics
   - Seasonal effects (freezing, flooding) impact river trade
   - Special river port buildings enhance riverine commerce
   - Viking and Rus river trade routes connect Northern Europe to Byzantium

9. **Maritime Innovation System** - Tracks naval technology development

   - Maritime innovations like the magnetic compass increase trade efficiency
   - Shipbuilding advancements unlock longer trade routes
   - Naval technologies spread through trade and cultural contact
   - Character knowledge impacts available maritime technologies
   - Technologies become available at historically appropriate times (magnetic compass ~1100-1200)

10. **Trade Technology System** - Represents financial and commercial innovations

    - Banking systems and financial instruments enhance trade
    - Bills of exchange reduce risks in long-distance trade (available after ~1150)
    - Currency and exchange mechanics for inter-regional commerce
    - Character education influences access to financial innovations
    - Advanced banking systems only available in later eras (Italian regions first, then spreading)

11. **Empire Peace Effects System** - Models political stability's impact on trade

    - Large, stable empires provide "Pax Mongolica" style trade safety bonuses
    - Empire fragmentation and civil wars disrupt established trade networks
    - Trade networks gradually recover after political shifts
    - Special protection mechanics for trade routes within strong realms
    - Pax Mongolica effects only active in appropriate historical period (~1250-1350)

### Player-Interactive Systems:

1. **Trade Buildings** - Allows players to construct specialized trade infrastructure

   - Extends the existing building system with trade-oriented structures
   - Buildings require specific holdings or terrain types, similar to vanilla restrictions
   - Higher tier buildings unlock unique trade mechanics or bonuses
   - Advanced buildings like banking houses only available in appropriate eras

2. **Merchant Character Interactions** - Enables new character actions related to trade

   - New character interactions for establishing relations with merchant organizations
   - Interactions with guild masters and merchant princes
   - Trade-specific hooks and favors that can be used in diplomacy
   - Trade-based casus belli for securing vital trade routes
   - Emphasis on indirect control through characters rather than direct management of trade agreements
   - Focus on character-driven gameplay that maintains CK3's role-playing elements
   - Trade relationships form organically through character interactions rather than abstract mechanics

3. **Trade Policy Decisions** - Lets players set realm-wide approaches to commerce

   - Works with the law system to establish trade-friendly policies
   - Affects realm priests' and vassals' opinions based on how policies impact them
   - Creates trade-offs between immediate income and long-term prosperity
   - Represents general attitudes rather than direct micromanagement of trade

4. **Caravan Events** - Provides narrative events related to trade caravans

   - Uses the same travel system as character journeys
   - Creates events that can occur along trade routes
   - Features dynamic outcomes based on character traits and skills

5. **Trade Fair System** - Allows hosting and participating in major trade fairs

   - Similar to feasts and hunts, but focused on commerce
   - Based on historical events like the Champagne fairs
   - Creates temporary economic boosts for hosting provinces
   - Brings foreign merchants and opportunities for cultural exchange
   - Special decisions and events during fairs
   - Available only after historical emergence (~1150 for Champagne fairs)

6. **Silk Road Interface** - Provides visualization and interaction with the Silk Road

   - Extends the map modes with a trade-focused view
   - Includes detailed information pages similar to the dynasty and faith screens
   - Allows interaction with trade routes and nodes from the map

7. **Mercantile Lifestyle Focus** - Adds trade-oriented character development paths

   - Expands the Stewardship lifestyle with a trade-focused path
   - New perks that enhance trade income and diplomatic relations
   - Special events and decisions unlocked through this focus

8. **Royal Court Trade Elements** - Enhances the Royal Court DLC with trade artifacts and court positions

   - Special court positions for merchant representatives
   - Unique artifacts from distant trading partners
   - Court grandeur benefits from active trade connections

9. **Vassal Contract Trade Obligations** - Modifies feudal contracts to include trade terms

   - New feudal obligation types related to trade taxes
   - Special provisions for mercantile vassals
   - Creates interesting decisions about vassal management for trade-focused rulers

10. **Merchant Republic Mechanics** - Special systems for merchant republics like Venice and Genoa

    - Unique government interactions focused on trade
    - Special buildings and development options
    - Patrician families competing for control of trade
    - Ability to establish trade quarters in foreign cities
    - Election mechanics influenced by trade success

11. **Explorer Mechanics System** - Enables character journeys for discovering trade opportunities

    - Trade expeditions similar to Marco Polo's travels
    - Knowledge transfer between distant regions
    - Discovery of new trade routes and goods
    - Special artifacts and court stories from distant lands
    - Character development through trade exploration
    - Historically restricted (no long-distance journeys before 1100, far-reaching expeditions only after 1200)

12. **Regional Trade Networks** - Provides specialized mechanics for historical trade regions

    - Viking trade networks in the Baltic and North Seas
    - Abbasid commercial system in the Middle East
    - Indian Ocean trade network connecting Africa, Arabia, and Asia
    - Song Dynasty maritime network in East Asia
    - West African gold trade routes across the Sahara

These systems work together to create a coherent trade experience that remains true to CK3's character-focused gameplay while adding significant economic depth. Players should feel that trade decisions are made by their character personality, not just for optimal economic outcomes. The systems extend and enhance existing game mechanics rather than creating parallel systems, ensuring the mod feels like a natural extension of the base game.
