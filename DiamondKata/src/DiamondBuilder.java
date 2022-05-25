import java.util.Arrays;
import java.util.List;

class DiamondBuilder {
    static final private List<String> alphabet = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
            "k", "l", "m", "n", "o", "p", "q",
            "r", "s", "t", "u", "v", "w", "x", "y", "z");

    final String letter;
    private int distance;

    public DiamondBuilder(String letter) {
        this.letter = letter;
        this.distance = alphabet.indexOf(this.letter);
    }

    void gap(int start, int end){
        for (int j = start; j < end; j++) {
            System.out.print(" ");
        }
    }

    void letterPrinter(int letterIndex){
        for (int k = 0; k <= (letterIndex * 2); k++) {
            if(k == 0 || k == (letterIndex * 2)){
                System.out.print(alphabet.get(letterIndex));
            }else{
                System.out.print(" ");
            }
        }
    }

    void builder() {
        for (int letterIndex = 0; letterIndex <= this.distance; letterIndex++) {

            gap(letterIndex, this.distance);
            letterPrinter(letterIndex);

            System.out.println();
        }

        for (int letterIndex = this.distance - 1; letterIndex >= 0; letterIndex--) {

            gap(letterIndex, this.distance);
            letterPrinter(letterIndex);

            System.out.println();
        }
    }
}
