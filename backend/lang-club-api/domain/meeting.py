from pydantic import BaseModel, UUID8
from typing import Optional, List
from datetime import datetime, timedelta
from .common import TimedMixin
from .account import Account
from .topic import Topic
from .task import Task

class Meeting(BaseModel, TimedMixin):
    id: UUID8
    topics: List[Topic]
    start_at: datetime
    duration: timedelta
    preparation_task: Task
    links: List[str]
    vocab: List[str]
    video_meeting_link: str
    created_by: Account

class Session(BaseModel, TimedMixin):
    id: UUID8
    duration: timedelta
    group_size: int
    task: Task
    meeting: Meeting

class Group(BaseModel, TimedMixin):
    id: UUID8
    label: str
    accounts: List[Account]
    session: Session
    formed_at: datetime
    auto_assigned: bool
