from pydantic import BaseModel, UUID8
from typing import Optional
from .common import TimedMixin
from .account import Account

class ProgramTemplate(TimedMixin, BaseModel):
    id: UUID8
    name: str
    description: Optional[str] = None
    lang: str
    created_by: Account

class Program(TimedMixin, BaseModel):
    id: UUID8
    name: str
    description: Optional[str] = None
    lang: str
    created_by: Account
    template: Optional[ProgramTemplate] = None
