from pydantic import BaseModel, UUID8
from typing import Optional, List
from datetime import datetime
from .common import TimedMixin
from .account import Account
from .topic import TopicTemplate, Topic

class VoteTemplate(TimedMixin, BaseModel):
    id: UUID8
    topics: List[TopicTemplate]
    closing_datetime: datetime
    votes: str
    created_by: Account

class Vote(TimedMixin, BaseModel):
    id: UUID8
    topics: List[Topic]
    closing_datetime: datetime
    votes: str
    created_by: Account
