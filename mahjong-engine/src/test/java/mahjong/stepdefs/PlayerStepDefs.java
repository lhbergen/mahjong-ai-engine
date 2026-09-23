package mahjong.stepdefs;

import io.cucumber.java.PendingException;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;

public class PlayerStepDefs {
    TestGame testGame;

    public PlayerStepDefs(TestGame testGame) {this.testGame = testGame;}

    @Given("^(.+) (does not have|has a|has \\d+) (.*)s?$")
    public void aPlayerGetsTiles(String name, String quantity, String tile){
        //get player hand
        //add tiles to hand
    }

    @Then("^(.+) (does not have|has a|has \\d+) (.*)s?$")
    public void aPlayerHasTiles(String name, String quantity, String tile){
        //get player hand
        //add tiles to hand
        throw new PendingException();
    }

    @Given("^(.+) has Mahjong$")
    public void aPlayerGetsMahjong() {
        //get player hand
        //get valid mahjong
        //add to player hand
        throw new PendingException();
    }

    @Then("^(.+) has Mahjong$")
    public void aPlayerHasMahjong() {
        //get player hand
        //check for validity
        throw new PendingException();
    }

    @Given("^(.+) has an exposure of a (pung|kong|quint|sextet) of (.+) with (no|\\d+) Jokers?")
    public void aPlayerGetsAnExposureWithJokers() {
        //get player
        //add exposure
        throw new PendingException();
    }

    @Then("^(.+) has an exposure of a (pung|kong|quint|sextet) of (.+) with (no|\\d+) Jokers?")
    public void aPlayerHasAnExposureWithJokers() {
        //get player
        //check exposures
        throw new PendingException();
    }

    @Given("^(.+) has an exposure of a (pung|kong|quint|sextet) of (.+)$")
    public void aPlayerGetsAnExposure() {
        //get player
        //add exposure
        throw new PendingException();
    }

    @Then("^(.+) has an exposure of a (pung|kong|quint|sextet) of (.+)$")
    public void aPlayerHasAnExposure() {
        //get player
        //check exposures
        throw new PendingException();
    }

    @Given("^(.+) is a (single|pair|pung|kong|quint|sextet) short of Mahjong")
    public void aPlayerIsShortOfMahjong() {
        //get player
        //get valid mahjong that contains <set>
        //add to hand
        //exchange <set> for other tiles
        throw new PendingException();
    }

    @Then("^(.+)'s hand has (gained|lost) (\\d+) tiles?")
    public void playerHasChangedTileCount() {
        //get initial hand
        //check that player has 1 less tile
        throw new PendingException();
    }
}
