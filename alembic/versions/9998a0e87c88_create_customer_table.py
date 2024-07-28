"""create customer table

Revision ID: 9998a0e87c88
Revises: 
Create Date: 2024-07-28 11:07:57.853207

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '9998a0e87c88'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade():
    op.create_table(
        'customer',
        sa.Column('id', sa.Integer, primary_key=True),
        sa.Column('name', sa.String(255), nullable=False)
    )


def downgrade():
    op.drop_table('customer')
