from typing import List
from blacksheep.server.controllers import APIController, get, post
from domain.account import (
    Account,
    AccountService
)

class AccountController(APIController):
    def __init__(self, acc_svc: AccountService):
        super().__init__()
        self.acc_svc = acc_svc

    @get("/")
    async def get_accounts(self) -> List[Account]:
        return await self.acc_svc.get_accounts()
    