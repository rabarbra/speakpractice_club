from pydantic import BaseModel, UUID8
from typing import Optional
from .common import TimedMixin
from .program import ProgramTemplate
from .account import Account
from datetime import datetime, timedelta
from enum import Enum

class EventType(str, Enum):
    MEETING = "meeting"
    WORKSHOP = "workshop"
    SEMINAR = "seminar"
    CONFERENCE = "conference"

class EventTemplate(TimedMixin, BaseModel):
    id: UUID8
    program_id: ProgramTemplate
    event_type: EventType
    type_entity: UUID8
    start_at: datetime
    duration: timedelta
    created_by: Account

class Event(TimedMixin, BaseModel):
    id: UUID8
    program_id: ProgramTemplate
    event_type: EventType
    type_entity_id: UUID8
    start_at: datetime
    duration: timedelta
    created_by: Account
