package mahjong.stepdefs;

import mahjong.Game;
import mahjong.player.Player;
import mahjong.player.PlayerFactory;

import java.util.HashMap;
import java.util.Map;

public class TestGame {
    private final Map<String, Player> players = new HashMap<>();
    private final Map<String, byte[]> initialHands = new HashMap<>();
    private final PlayerFactory playerFactory = new PlayerFactory();
    private Game game;

    public Game getGame(){
        if (game == null) {
            game = new Game();
        }
        return game;
    }

    public Player getPlayer(String name){
        return players.getOrDefault(name, putPlayer(name));
    }

    public Player putPlayer(String name){
        Player newPlayer = playerFactory.createDefault(name);
        getGame().addPlayer(newPlayer);
        players.put(name, newPlayer);
        return newPlayer;
    }

    public byte[] getInitialHand(String name){
        return initialHands.getOrDefault(name, putHand(name));
    }

    public byte[] putHand(String name){
        byte[] hand = getPlayer(name).getHand();
        initialHands.put(name, hand);
        return hand;
    }
}
