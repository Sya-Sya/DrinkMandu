using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using template.domain;
using System.Xml.Linq;

namespace template.business.ApiService;
public interface IApiServiceBusiness
{
    string HttpPostRequestServices(string ServiceProviderName, string FunctionName, object Data);
    Task<CommonDBResponse?> HttpPostRequestApi<CommonDBResponse>(CommonAttributeRequest requestdata, string? ApiUrl, string? Apiurlfor, string? GeneratedToken);
    CommonAttributeRequest GetRequestData<T>(string FunctionName, string? value, T obj1);
}