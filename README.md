# 🎮 Free Fire Database

A relational database mini-world project modeled after the popular battle royale game **Garena Free Fire**. This project demonstrates the design and implementation of a full-fledged MySQL database schema covering players, guilds, weapons, matches, missions, and more — along with an interactive Python CLI for performing CRUD operations and custom queries.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Database Schema](#database-schema)
- [Entity-Relationship Summary](#entity-relationship-summary)
- [Python CLI Application](#python-cli-application)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)

---

## Overview

This project was built as a **Database Management Systems (DBMS)** mini-world exercise. It models the core gameplay entities of Free Fire, including:

- **Players** with profiles, stats, and guild memberships
- **Weapons** with attributes like damage, rate of fire, and armour penetration
- **Weapon Skins** that can be equipped and rewarded through missions
- **Characters** with unique active/passive skills
- **Guilds** with leaders and member rosters
- **Matches** played across different maps and modes (Battle Royale / Clash Squad)
- **Missions** that reward players with weapon skins upon completion
- **Store & Inventory** for purchasing and managing items
- **Achievements** and **Friend** relationships between players

---

## Database Schema

The SQL schema (`ff.sql`) defines **22 tables** covering all core entities and their relationships:

| Table | Description |
|---|---|
| `PLAYERS` | Core player profile (username, level, diamonds, region, guild) |
| `STATS` | Per-season stats: K/D ratio, rank, headshot rate, win count |
| `WINS` | Win-percentage lookup table keyed by matches and wins |
| `GUILD` | Guild info including leader and level |
| `MEMBERS_OF` | Many-to-many: players ↔ guilds |
| `FRIENDS` | Self-referencing friendship relation on players |
| `WEAPONS` | Weapon catalogue (AK-47, M4A1, MP40, AWM, Desert Eagle) |
| `WSKININFO` | Stat bonuses provided by each weapon skin |
| `WEAPONSKINS` | Associates skins to weapon types |
| `CHARACTERS` | Playable characters with skills (Dj Alok, Kelly, A124, …) |
| `MATCHES` | Match records with map and mode (BR/CS) |
| `PARTICIPATES_IN` | Many-to-many: players ↔ matches |
| `WINNERS` | Records match winners |
| `MISSIONS` | In-game challenge missions with reward descriptions |
| `INCLUDES` | Maps missions to the matches they appear in |
| `COMPLETES` | Tracks which player completed which mission in which match |
| `REWARDS` | Links weapon skin rewards to missions |
| `INVENTORY` | Player inventory (equipped status per item) |
| `INVENTORY_ITEMS` | Item catalogue by type (Character / Weapon Skin) |
| `STORE` | Purchasable items with cost |
| `BUYS_IN` | Purchase history: players ↔ store items |
| `EQUIPS` | Tracks which player equipped which skin on which weapon |
| `ACHIEVEMENTS` | Achievement count per player |

The file also seeds the database with sample data for 7 players, 5 weapons, 5 characters, 5 matches, and 5 missions.

---

## Entity-Relationship Summary

```
PLAYERS ──< STATS (per season)
PLAYERS ──< MEMBERS_OF >── GUILD
PLAYERS ──< FRIENDS >── PLAYERS (self-join)
PLAYERS ──< PARTICIPATES_IN >── MATCHES
PLAYERS ──< COMPLETES >── MISSIONS (via match)
PLAYERS ──< INVENTORY >── INVENTORY_ITEMS
PLAYERS ──< BUYS_IN >── STORE
PLAYERS ──< EQUIPS >── WEAPONS + WEAPONSKINS
WEAPONS ──< WEAPONSKINS >── WSKININFO
WEAPONSKINS ──< REWARDS >── MISSIONS
MISSIONS ──< INCLUDES >── MATCHES
MATCHES ──< WINNERS >── PLAYERS
```

---

## Python CLI Application

`source_code/MiniWorld.py` is an interactive command-line interface that connects to the MySQL database and exposes the following operations:

| Option | Operation | Description |
|--------|-----------|-------------|
| 1 | **Insert** | Add a new row to any table |
| 2 | **Delete** | Remove rows from a table with a condition |
| 3 | **Update** | Modify existing rows based on a condition |
| 4 | **Selection** | `SELECT *` from a table with optional `WHERE` clause |
| 5 | **Projection** | `SELECT` specific columns from a table |
| 6 | **Aggregate** | Apply `AVG`, `MAX`, `MIN`, or `SUM` on a column |
| 7 | **Search** | Find rows where a column equals a given value |
| 8 | **User-Defined** | Pre-built analytical queries (see below) |
| 9 | **Logout** | Exit the application |

### User-Defined Queries

1. **Best Players of a Guild** — Given a guild ID, returns players who have played more than 50 matches *and* have a headshot rate above the guild's average.
2. **Country Rankings** — Orders all regions by their players' combined average CS and BR K/D ratios.

Query results are formatted as **pretty-printed tables** using the `tabulate` library.

---

## Getting Started

### Prerequisites

- Python 3.7+
- MySQL Server (v5.7+ or MariaDB equivalent)
- A MySQL user with read/write access

### 1. Set Up the Database

Log into MySQL and run the SQL dump:

```bash
mysql -u <username> -p < ff.sql
```

This will create and populate a database named `freefire`.

### 2. Install Python Dependencies

```bash
pip install pymysql tabulate
```

### 3. Run the Application

```bash
cd source_code
python MiniWorld.py
```

You will be prompted for your MySQL username and password. The app connects to `127.0.0.1:3306` by default.

---

## Usage

### Example — View all players

```
Enter choice> 4        # Selection
ENTER THE TABLES: PLAYERS
Condition[Y/N]: N
```

### Example — Find best players in a guild

```
Enter choice> 8        # User Defined Functions
1. Best Players Of a Guild
2. Order Of countries with best players
ENTER YOUR CHOICE OF AGGREGATE: 1
ENTER GUILD ID: 101
```

### Example — Aggregate headshot rates

```
Enter choice> 6        # Aggregate Functions
1. AVG  2. MAX  3. MIN  4. SUM
ENTER YOUR CHOICE OF AGGREGATE: 1
ENTER THE COLUMN TO BE SELECTED: Headshot_rate
ENTER THE TABLES: STATS
Condition[Y/N]: N
```

---

## Project Structure

```
Free-Fire-Database/
├── ff.sql                  # Full MySQL schema + seed data
├── source_code/
│   └── MiniWorld.py        # Interactive Python CLI application
├── 37_report.pdf           # Project report (Phase 1 / ER design)
└── phase3.pdf              # Project report (Phase 3 / implementation)
```

---

## Dependencies

| Package | Purpose |
|---------|---------|
| `pymysql` | Pure-Python MySQL client for database connectivity |
| `tabulate` | Formats query results as readable ASCII tables |
| `subprocess` | Used to clear the terminal between menus |

---

## License

This project was developed as an academic DBMS assignment. Feel free to use or adapt it for learning purposes.
