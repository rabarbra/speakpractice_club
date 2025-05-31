from pydantic import BaseModel, UUID8
from typing import Optional, List
from .common import TimedMixin
from .account import Account
from .topic import TopicTemplate, Topic

class TaskTemplate(TimedMixin, BaseModel):
    id: UUID8
    topic: TopicTemplate
    name: str
    description: str
    content: str
    attachments: List[str]
    created_by: Account

class Task(TimedMixin, BaseModel):
    id: UUID8
    topic: Topic
    name: str
    description: str
    content: str
    attachments: List[str]
    created_by: Account
