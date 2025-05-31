from pydantic import BaseModel, UUID8
from typing import Optional, List
from datetime import datetime
from .common import TimedMixin
from .account import Account

class Device(BaseModel, TimedMixin):
    id: UUID8
    account: Account
    color_theme: str
    settings: str
