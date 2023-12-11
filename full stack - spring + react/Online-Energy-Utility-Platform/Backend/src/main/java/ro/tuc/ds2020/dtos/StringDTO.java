package ro.tuc.ds2020.dtos;

public class StringDTO {
    String string;

    public StringDTO(String string) {
        this.string = string;
    }

    public StringDTO() {
    }

    public String getString() {
        return string;
    }

    public void setString(String string) {
        this.string = string;
    }
}
