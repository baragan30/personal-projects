package ro.tuc.ds2020.dtos;

import java.time.LocalDate;

public class GetMeasurementDTO {
    private Long deviceId;
    private LocalDate date;

    public GetMeasurementDTO(Long deviceId, LocalDate date) {
        this.deviceId = deviceId;
        this.date = date;
    }

    public GetMeasurementDTO() {

    }

    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long deviceId) {
        this.deviceId = deviceId;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "GetMeasurementDTO{" +
                "deviceId=" + deviceId +
                ", date=" + date +
                '}';
    }
}
