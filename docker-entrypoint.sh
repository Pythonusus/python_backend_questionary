#!/usr/bin/env bash

# Exit on error
set -o errexit

# Migrations should be made during development
# and added to version control.
# During build we will only apply them to the database.
# Apply migrations
echo "Applying database migrations..."
make migrate

# Create superuser if needed. Continue on fail.
echo "Creating superuser if it doesn't exist..."
make createsuperuser || true

echo "Entrypoint script finished successfully!"

# Execute the command passed to docker run
exec "$@"
