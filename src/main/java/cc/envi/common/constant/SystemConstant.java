package cc.envi.common.constant;

public interface SystemConstant {


    enum SystemStatus{
        /**
         * 正常
         */
        SUCCESS("0"),
        /**
         * 暂停
         */
        ERROR("1");

        private String value;

        private SystemStatus(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }
}
