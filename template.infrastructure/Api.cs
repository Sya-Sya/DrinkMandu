using Microsoft.Extensions.Configuration;

namespace template.infrastructure
{
    public class Api
    {
        private readonly IConfiguration _Apiconfiguration;
        private readonly string _ApiUrl;

        public Api(IConfiguration configuration)
        {
            _Apiconfiguration = configuration;
            _ApiUrl = _Apiconfiguration["ApiUrl"];

        }
    }
}