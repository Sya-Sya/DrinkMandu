namespace template.application.Models
{
    public class ServiceDetailModel
    {
        public string  user_login_id { get; set; }
        public string product_id { get; set; }
        public string created_platform { get; set; }
    }

    public class ServiceDetailresponseModel
    {
        public string product_id { get; set; }
        public string txn_type { get; set; }
        public string company_id { get; set; }
        public string company { get; set; }
        public string product_type_id { get; set; }
        public string product_type { get; set; }
        public string product_label { get; set; }
        public string product_logo { get; set; }
        public string created_local_date { get; set; }
        public string product_service_info { get; set; }
        public string status { get; set; }
        public CommissionList commission_list { get; set; }
        public DenominationList denomination_list { get; set; }
    }

    public class CommissionList
    {
        public string commission_type { get; set; }
        public string commission_value { get; set; }
    }

    public class DenominationList
    {
        public string min { get; set; }
        public string max { get; set; }
    }
}