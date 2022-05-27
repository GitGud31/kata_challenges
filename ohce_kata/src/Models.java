import java.time.LocalDateTime;
import java.util.Scanner;

class OhceBot {
    static final String EXIT_BOT = "Stop!";
    static final String TWENTY_TO_SIX = "¡Buenas noches";
    static final String SIX_TO_TWELVE = "¡Buenos días";
    static final String TWELVE_TO_TWENTY = "¡Buenas tardes";
    static final String FOUND_PALINDROME = "¡Bonita palabra!";

    final Scanner sc;
    boolean isFirstMessage;
    String userInput;
    String userName;
    LocalDateTime time;

    OhceBot(LocalDateTime time) {
        this.isFirstMessage = true;
        this.time = time;
        this.userInput = "";
        this.userName = "";
        this.sc = new Scanner(System.in);
    }

    void running() {
        System.out.println("Type: Stop! to exit.");

        
        do {
            readInput();
            botResponse();
        } while (!this.userInput.equals(EXIT_BOT));
    }

    void readInput() {
        System.out.println();
        
        if (this.isFirstMessage) {
            System.out.print("> What's your name: ");
            this.userName = sc.nextLine();
        } else {
            System.out.print("$ ");
            this.userInput = sc.nextLine();
        }
    }

    private void botResponse() {
        final int hour = this.time.getHour();

        if (this.userInput.equals(EXIT_BOT)) {
            System.out.println("Adios " + this.userName);
            return;
        }

        if (this.isFirstMessage) {
            this.isFirstMessage = false;

            System.out.println();
            if ((hour > 20 && hour < 24) || (hour > 0 && hour <= 6)) {
                System.out.print("> " + TWENTY_TO_SIX + " " + this.userName);
            }
            if (hour > 6 && hour <= 12) {
                System.out.print("> " + SIX_TO_TWELVE + " " + this.userName);
            }
            if (hour > 12 && hour <= 20) {
                System.out.print("> " + TWELVE_TO_TWENTY + " " + this.userName);
            }
            System.out.println();
        } else {

            System.out.println();
            if (isPalindrome()) {
                System.out.print("> " + this.userInput);
                System.out.print("> " + FOUND_PALINDROME);
            } else {
                System.out.print("> " + this.userInput);
            }
        }
    }

    private boolean isPalindrome() {
        String reverse = new String();
        int length = this.userInput.length();

        for (int i = length - 1; i >= 0; i--) {
            reverse += this.userInput.charAt(i);
        }

        if (!this.userInput.equals(reverse)) {
            this.userInput = reverse;
            return false;
        }
        return true;
    }
}
