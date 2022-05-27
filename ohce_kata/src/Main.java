/**
 * Kata description link: https://kata-log.rocks/ohce-kata
 *  */

import java.time.LocalDateTime;

public class Main {
    public static void main(String[] args) {
        final OhceBot game = new OhceBot(LocalDateTime.now());

        game.running();
    }
}
