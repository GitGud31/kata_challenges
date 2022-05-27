import java.time.LocalDateTime;
import java.util.Objects;
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

    //special treatment for first message, ask for username
    //check for palindrome
    //an infinite loop until user types Stop!
    //reverse user input if note palindrome

    OhceBot(LocalDateTime time) {
        this.isFirstMessage = true;
        this.time = time;
        this.userInput = "";
        this.userName = "";
        this.sc = new Scanner(System.in);
    }

    void readInput() {
        if (isFirstMessage) {
            System.out.println("$ What's your name: ");
            this.userName = sc.nextLine();
        } else {
            System.out.println("> ");
            this.userInput = sc.nextLine();
        }
        this.isFirstMessage = false;
        this.time = LocalDateTime.now();
    }

    void running() {
        System.out.println("Type: Stop! to exit.");
        do {
            readInput();
            botResponse();
        } while (!Objects.equals(userInput, EXIT_BOT));
    }

    private void botResponse() {
        final int hour = this.time.getHour();
        if (this.isFirstMessage) {
            if (hour >= 12 && hour <= 20) {
                System.out.println("$ " + TWELVE_TO_TWENTY + " " + this.userName);
            }
            if (hour >= 6 && hour <= 12) {
                System.out.println("$ " + SIX_TO_TWELVE + " " + this.userName);
            }
            if (hour >= 20 && hour <= 6) {
                System.out.println("$ " + TWENTY_TO_SIX + " " + this.userName);
            }
        } else {
            if (isPalindrome()) {
                System.out.println("$ " + this.userInput);
                System.out.println("$ " + FOUND_PALINDROME);
            } else {
                System.out.println("$ " + this.userInput);
            }
        }
    }

    private boolean isPalindrome() {
        StringBuilder reverse = new StringBuilder();
        int length = userInput.length();

        for (int i = length - 1; i >= 0; i--) {
            reverse.append(userInput.charAt(i));
        }

        System.out.println(reverse);

        if (this.userInput.equals(reverse.toString())) {
            System.out.println("in");
            this.userInput = reverse.toString();
            return true;
        }
        return false;
    }
}

