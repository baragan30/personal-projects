package ro.tuc.ds2020.entities;

import java.util.Date;

public class Measurement {
    private Long deviceId;
    private Date timestamp;
    private float value;

    public Measurement(Long id, Date timestamp, float value) {
        this.deviceId = id;
        this.timestamp = timestamp;
        this.value = value;
    }

    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long deviceId) {
        this.deviceId = deviceId;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public float getValue() {
        return value;
    }

    public void setValue(float value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "Measurement{" +
                "id=" + deviceId +
                ", timestamp=" + timestamp +
                ", value=" + value +
                '}';
    }
}
