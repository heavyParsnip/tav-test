//Matt Camera's technical test for Tavernlight Games

//Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);

    if (!player) {
        player = new Player(nullptr) // Manual pointer creation? Better clean up after yourself...
        
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            delete (player); // Needs to be cleaned up if this is going to return early.
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);  // I assume Item::CreateItem() doesn't allocate dynamically with 'new'. If it does, delete would need to be called on item as well after lines 20 and 30.
    if (!item) {
        delete (player); // Ditto...need to clean up in case new Player(nullptr) was invoked earlier
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if(player->isOffline()) {
        IOLoginData::savePlayer(player);
    }

    delete (player); // Ditto...
}