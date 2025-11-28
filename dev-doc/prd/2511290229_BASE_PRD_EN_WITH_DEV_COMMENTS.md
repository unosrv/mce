# Project Brief

**[dev]**  means developer's opinion or comment for better understanding.

## Project Overview

- Build a SaaS platform that measures greenhouse gas emissions from livestock farms (Korea/USA/Brazil) and automatically generates carbon emission reports
=> **[dev]** We will strictly follow i18n strategy all texts, labels, contents in the code should be ready for multilingual support including Korean, English(US), Portuguese(Brazil). No hard-coded text allowed in the code.
=> **[dev]** We should establish i18n strategy before implement detailed logic in the project.
- Farmers input livestock information, feed, housing environment, and manure management data; the system calculates emissions using IPCC Tier 2 methodology and provides reports
=> We should thoroughly investigate about IPCC Tier 2 methodology before implementing the calculation logic. This is the core of the project. Proactively use all possible resources including web search, reference documents, and ask the user if you need any specific documentations.

## Required Components

- Web front-end development
=> **[dev]** Phoenix LiveView based front-end development is preferred unless the user request otherwise.
- Back-end development
=> **[dev]** Phoenix framework will all cover this.
- Admin panel development
=> **[dev]** Backpex admin dashboard is preferred unless the user request otherwise.
- Server/DB/infrastructure configuration

## Development Environment/Languages

- Language: Node.js or Python (no other languages)
=> **[dev]** This will be definitely Elixir, do not worry about Node.js or Python.
- DBMS: PostgreSQL or MySQL
=> **[dev]** PostgreSQL is preferred unless the user request otherwise.
- Please propose additional stack components
=> **[dev]** We will use TailwindCSS with DaisyUI component library for rapid UI development unless the user request otherwise.
=> **[dev]** Remove default Phoenix theme and use DaisyUI default theme `https://daisyui.com/docs/themes/`

## Materials Provided by Client
=> **[dev]** You don't worry about these deliverable documents at all.
- Detailed work specification (A4, 3 pages)
- ERD
- Figma design (to be provided)

## Core Features

### User Authentication
- Email-based login
- Nickname usage
=> **[dev]** Copy the components in proper place and refactor them for our project since Phoenix default components use hard-coded English texts.
=> **[dev]** All interface including validation messages, flash messages should follow i18n strategy.

### Farm Management
- Multiple farm registration
- Country-specific address input (Google Maps)
=> **[dev]** Address input form should be dynamically changed based on the selected country since, for example, Brazil has different address format from Korea or USA.
=> **[dev]** Use generally adopted address input style for each country.
=> **[dev]** Use address searching API for Korean address input. Research about popular address searching API in Korea and follow the best practice and well adopted pattern.
- Fiscal year configuration
=> **[dev]** I am not sure about this requirement. Please implement this with flexible way since fiscal year may differ farm by farm or country by country.

### Livestock Group Management
5-step input form:
=> **[dev]** This is very critical part of the project. We should carefully implement this part based on the architecture and planned data structure.
1. **Basic Information**: Species/head count/weight/milk yield
2. **Feed**: Maximum 10 items, preset support, additives
3. **Housing Environment**: Monthly ratio of barn/exercise yard/grazing
4. **Barn Information**: Area/temperature/type
5. **Manure Management**: Branching logic (anaerobic digester/solid-liquid separator/treatment system)

### Emissions Report
- Automatic generation per farm
- Emissions by category (enteric fermentation/manure/feed/energy)
- Detailed breakdown by livestock group
- PDF export

### Dashboard
=> **[dev]** backpex should have robust graphical dashboard on the main dashboard page.
=> **[dev]** Use JavaScript charting library for better user experience.
- Overall farm statistics
- Monthly trends
- Farm-to-farm comparison

## Required Qualifications
=> **[dev]** You don't have to worry about this category at all.
- Team capable of short-term development (3 weeks)
- Experience implementing complex business logic (mandatory)
- Database design capability (22 tables, complex relationships)
- Multilingual service development experience (English/Korean, automatic unit conversion, etc.)

## Reference Sites/Applications
=> **[dev]** These site are recommended as reference by the client. However, these sites do not have good design, UI, UX at all. We should research better designed similar services on the internet for better user experience. This is very critical to win the project.
- https://app.coolfarmtool.org/
- https://comet-farm.com/

## Deliverables
=> **[dev]** You don't have to worry about this category at all.
- Source code
- Development documentation (scope to be agreed)

## Notes for Applicants
=> **[dev]** You don't have to worry about this category at all.
- This project is conducted as part of a government support programme; only partners with registered businesses are eligible for contract

**[dev]**
  - UI design is very critical to win the project. Proactively research better designed similar services on the internet.
  - Always check UI functionality and aesthetics both.
  - I know this is very short PRD, but we have to make it. Use your creative imaginary skills to fill the gaps.
  - You think you are the CEO of startup company who is working on this Project. Make it perfect.
  - Always proactively leverage echo system of Elixir and Phoenix by using pre-made packages or libraries from the community.
  - Ask the use who is the main  developer if you have any thing unclear or have any question.
