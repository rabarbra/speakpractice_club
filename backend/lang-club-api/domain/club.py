from pydantic import BaseModel, UUID8
from typing import Optional, List
from datetime import timezone, datetime
from .common import TimedMixin
from .program import Program
from .account import Account

class Club(TimedMixin, BaseModel):
    id: UUID8
    name: str
    description: str
    logo: str
    rules: str
    language: str
    program: Program
    categories: List[str]
    time_zone: timezone
    is_public: bool
    invite_code: str
    created_by: Account

class ClubMembership(TimedMixin, BaseModel):
    id: UUID8
    account_id: Account
    club: Club
    role: str
    joined_at: datetime
    active: bool
