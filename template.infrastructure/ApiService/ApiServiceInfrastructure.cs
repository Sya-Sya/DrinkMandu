using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using template.application.Models;
using Microsoft.Extensions.Configuration.Json;
using template.business.Login;
using template.business.ApiService;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc;
using template.domain;
using Newtonsoft.Json.Linq;
using System.Reflection;
using System.Security.Policy;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using template.domain.Models.Login;
using template.infrastructure.Library;
using Dapper;
using System.Data;
using AutoMapper;

namespace template.infrastructure.ApiService
{
    public class ApiServiceInfrastructure : IApiServiceBusiness
    {

        private readonly HttpClient _httpClient;

        public ApiServiceInfrastructure(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public string HttpPostRequestServices(string ServiceProviderName, string FunctionName, object Data)
        {

            var url = ConfigurationManager.AppSettings["APIMSMiddlewareurl"];
            var PartnerName = ConfigurationManager.AppSettings["APIMSMiddlewareurl"];
            var request = WebRequest.Create(url) as HttpWebRequest;
            var ApiServiceRequestModel = new ApiServiceRequestCommon   //data
            {
                ServiceProviderName = ServiceProviderName,
                FunctionName = FunctionName,
                PartnerName = PartnerName,
                Data = Data, //.ToString(),

            };
            var dataBytes = Encoding.ASCII.GetBytes(Newtonsoft.Json.JsonConvert.SerializeObject(ApiServiceRequestModel));
            request.Method = "POST";
            request.ContentType = "application/json;charset=UTF-8";
            request.ContentLength = dataBytes.Length;
            request.Accept = "application/json";
            request.ProtocolVersion = HttpVersion.Version10;
            request.UserAgent = "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)";
            string responseString = "";
            try
            {
                using (var stream = request.GetRequestStream())
                {
                    stream.Write(dataBytes, 0, dataBytes.Length);
                }
                if (ConfigurationManager.AppSettings["EnableTls"] != null && Convert.ToString(ConfigurationManager.AppSettings["EnableTls"]) == "Y")
                {
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
                }
                var response = (HttpWebResponse)request.GetResponse();
                responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

            }
            catch (WebException wex)
            {
                if (wex.Response != null)
                {
                    using (var errorResponse = (HttpWebResponse)wex.Response)
                    {
                        using (var reader = new StreamReader(errorResponse.GetResponseStream()))
                        {
                            responseString = reader.ReadToEnd();
                        }
                    }
                }
            }
            return responseString;
        }

        [HttpPost]
        public async Task<T?> HttpPostRequestApi<T>(CommonAttributeRequest requestdata, string? ApiUrl, string? Apiurlfor, string GeneratedToken)
        {

            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(requestdata), Encoding.UTF8, "application/json");

                httpClient.DefaultRequestHeaders.Accept.Clear();
                if (Apiurlfor == "Basic")
                {
                    string username = "wePayApiUser";
                    string password = "wePayAp1us3r@20";
                    string plaintextCredentials = $"{username}:{password}";
                    string Token = Convert.ToBase64String(Encoding.UTF8.GetBytes(plaintextCredentials));
                    httpClient.DefaultRequestHeaders.Add("Authorization", "Basic " + Token);
                }
                else
                {
                    httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + GeneratedToken);
                }

                httpClient.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
                using (var response = await httpClient.PostAsync(ApiUrl, content))
                {
                    string apiResponse1 = await response.Content.ReadAsStringAsync();
                    return JsonConvert.DeserializeObject<T>(apiResponse1);
                }
            }
        }
        public CommonAttributeRequest GetRequestData<T>(string FunctionName, string? value, T obj1)
        {
            CommonAttributeRequest request = new CommonAttributeRequest();
            switch (FunctionName)
            {
                case ("SignIn"):
                    request.FunctionName = FunctionName;
                    var info = new DeviceInfo
                    {
                        device_name = "lenevo",
                        os_version = "windows",
                        model = "1",
                        device_id = "2"
                    };
                    var Stringinfo = JsonConvert.SerializeObject(info);
                    //start mapping //

                    var config = new MapperConfiguration(cfg =>
                    {
                        cfg.CreateMap<T, LoginCommon>();
                    });

                    var modelObject = config.CreateMapper().Map<LoginCommon>(obj1);

                    //end mapping //

                    var jdata = new LoginCommonApi
                    {
                        user_login_id = modelObject.UserName,
                        created_platform = "web",
                        password = modelObject.Password,
                        version_id = "2",
                        ipAddress = ":1",
                        info = Stringinfo
                    };
                    request.Data = Convert.ToBase64String(Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(jdata)));
                    byte[] MessageBytes = request.Data.FromBase64ToBytes();//convert request data into bytes
                    string data = MessageBytes.FromBytesToString();//converts from bytes to string           
                    StringCipher sign = new StringCipher(value);
                    request.Signature = sign.GetSignature(JsonConvert.SerializeObject(jdata));
                    return request;
                default:
                    request.FunctionName = FunctionName;
                    var Logedindata = new ApiCommonRequest
                    {
                        user_login_id = "9867718033",
                        created_platform = "web",
                        product_id="5",
                    };
                    request.Data = Convert.ToBase64String(Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(Logedindata)));
                    byte[] LogedinMessageBytes = request.Data.FromBase64ToBytes();//convert request data into bytes       
                    StringCipher Logedinsign = new StringCipher(value);
                    request.Signature = Logedinsign.GetSignature(JsonConvert.SerializeObject(Logedindata));
                    return request;
            }




        }



        //[HttpPost]
        //public async Task<IActionResult> AddReservation(Reservation reservation)
        //{
        //    Reservation receivedReservation = new Reservation();
        //    using (var httpClient = new HttpClient())
        //    {
        //        StringContent content = new StringContent(JsonConvert.SerializeObject(reservation), Encoding.UTF8, "application/json");

        //        using (var response = await httpClient.PostAsync("https://localhost:44324/api/Reservation", content))
        //        {
        //            string apiResponse = await response.Content.ReadAsStringAsync();
        //            receivedReservation = JsonConvert.DeserializeObject<Reservation>(apiResponse);
        //        }
        //    }
        //    return View(receivedReservation);
        //}



        //public async Task<List<Product>> GetProductsAsync()
        //{
        //    var response = await _httpClient.GetAsync("https://myapi.com/products");
        //    response.EnsureSuccessStatusCode();
        //    var content = await response.Content.ReadAsStringAsync();
        //    return JsonSerializer.Deserialize<List<Product>>(content);
        //}
    }
}
