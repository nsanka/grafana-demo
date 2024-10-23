# Grafana with PostgreSQL

## Create virtual environment using poetry as below:
### Start fresh
poetry new grafana-demo<br>
poetry add psycopg2 sqlalchemy ipykernel

### Using pyproject.toml
poetry install

### Open Shell with this environment
poetry shell

## Crate PostGIS and PGAdmin dockers using docker compose file
### Start Dockers
docker compose up -d

### End Dockers
docker compose down