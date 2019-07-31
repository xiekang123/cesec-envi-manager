package cc.envi.common.constant;

public interface SystemConstant {


    enum JobStatus{
        /**
         * 正常
         */
        SUCCESS("0"),
        /**
         * 暂停
         */
        ERROR("1");

        private String value;

        private JobStatus(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }

    enum ScheduleStatus {
        /**
         * 正常
         */
        NORMAL("0"),
        /**
         * 暂停
         */
        PAUSE("1");

        private String value;

        ScheduleStatus(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }
}
