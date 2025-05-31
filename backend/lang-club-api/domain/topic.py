from pydantic import BaseModel, UUID8
from typing import Optional, List
from .common import TimedMixin
from .account import Account

class TopicTemplate(TimedMixin, BaseModel):
    id: UUID8
    name: str
    description: str
    links: List[str]
    attachments: List[str]
    content: str
    vocab_items: List[str]
    created_by: Account

class Topic(TimedMixin, BaseModel):
    id: UUID8
    name: str
    description: str
    links: List[str]
    attachments: List[str]
    content: str
    vocab_items: List[str]
    created_by: Account
