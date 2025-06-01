from typing import List, Optional
from blacksheep.server.controllers import APIController, get, post
from domain.account import (
    Account,
    AccountService
)

class AccountController(APIController):
    def __init__(self, acc_svc: AccountService):
        super().__init__()
        self.acc_svc = acc_svc

    @classmethod
    def version(cls) -> str:
        return "v1"

    @classmethod
    def class_name(cls) -> str:
        return "Account"

    @get("/")
    async def get_accounts(self) -> List[Account]:
        return await self.acc_svc.get_accounts()
