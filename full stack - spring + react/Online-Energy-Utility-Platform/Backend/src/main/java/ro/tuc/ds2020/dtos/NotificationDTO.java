package ro.tuc.ds2020.dtos;

public class NotificationDTO {
    private String header;
    private String body;

    public NotificationDTO() {
    }

    public NotificationDTO(String header, String body) {
        this.header = header;
        this.body = body;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    @Override
    public String toString() {
        return "NotificationDTO{" +
                "header='" + header + '\'' +
                ", body='" + body + '\'' +
                '}';
    }
}
