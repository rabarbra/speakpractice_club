"""
Common domain models reused across several API endpoints.
"""
from pydantic import BaseModel, UUID8
from abc import ABC
from typing import Optional, List
from datetime import datetime
from .common import TimedMixin


class LangLevel(BaseModel):
    lang: str
    level: str
    updated_at: datetime
    source: str

class Account(TimedMixin, BaseModel):
    """
    Account model representing a user account in the system.
    """
    id: UUID8
    name: str
    avatar: str
    email: str
    access_token: str
    refresh_token: str
    verified: bool
    last_login_at: datetime
    pass_hash: str
    lang_levels: List[LangLevel]


class AccountRepository(ABC):
    async def get_account(self, account_id: UUID8) -> Optional[Account]:
        ...
    
    async def get_accounts(self, account_id: UUID8) -> List[Account]:
        ...
    
    async def create_account(self, data: Account) -> None:
        ...
    
    async def create_account(self, data: Account) -> None:
        ...

class AccountService:
    def __init__(
        self,
        account_repo: AccountRepository,
    ):
        self.account_repo = account_repo

    def get_accounts(self) -> List[Account]:
        ...