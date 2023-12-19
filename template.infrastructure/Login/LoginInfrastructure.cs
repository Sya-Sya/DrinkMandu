using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using template.business.Login;
using template.domain;
using template.domain.Models.Login;
using System.Collections;
using System.Reflection;
using System.Net.Http;
using RestSharp;
using System.Text.Json;
using Microsoft.Extensions.Configuration;
using template.infrastructure.Library;
using System.Net;
using template.infrastructure.ApiService;
using template.business.ApiService;
using Newtonsoft.Json;
using Microsoft.Web.Administration;
using template.domain.Enums;
using Microsoft.AspNetCore.Http;

namespace template.infrastructure.Login
{
    public class LoginInfrastructure : ILoginBusiness
    {
        private readonly DapperContext _context;
        private readonly IApiServiceBusiness _Api;
        public LoginInfrastructure(DapperContext context, IApiServiceBusiness Api)
        {
            _context = context;
            _Api = Api;
        }
        public async Task<CommonDBResponse> CheckUserLogin(LoginCommon model, CommonAttributeRequest apirequest)
        {
            CommonDBResponse obj = new CommonDBResponse();
            var _IsApiCall = _context._IsApiCall;
            var ApiUrl = _context._ApiUrl;
            try
            {
                if (_IsApiCall == "1")
                {
                    apirequest.FunctionName = ConnectFunctions.SignIn.ToString();
                    CommonDBResponseEncryption objkey = getEncryptionKeyByUsername("wePayApiUser");//get encryption key
                    if (objkey.code != "0")
                    {
                        return new CommonDBResponse
                        {
                            Code = "1",
                            Message = objkey.message,

                        };
                    }
                    var requestdata = _Api.GetRequestData<LoginCommon>(apirequest.FunctionName, objkey.encryption_key, model);
                    var response = await _Api.HttpPostRequestApi<CommonDBResponse>(requestdata, ApiUrl, "Basic", "");
                    CommonDBResponse? objresponse = JsonConvert.DeserializeObject<CommonDBResponse>(JsonConvert.SerializeObject(response));
                    return new CommonDBResponse
                    {
                        Code = objresponse?.Code,
                        Message = objresponse?.Message,
                        Data = objresponse?.Data,
                    };
                }
                else
                {
                    var param = new DynamicParameters();
                    param.Add("@flag", "login");
                    param.Add("@userName", model.UserName);
                    param.Add("@password", model.Password);
                    param.Add("@ip", model.actionIp);
                    param.Add("@sessionId", model.SessionId);
                    using (var connection = _context.CreateConnection())
                    {
                        obj = connection.QueryFirstOrDefault<LoginCommon>(sql: "[dbo].[sproc_wallet_user_login]", param: param, commandType: CommandType.StoredProcedure);
                        return new CommonDBResponse
                        {
                            Code = obj.Code,
                            Message = obj.Message,
                            Data = obj,
                        };
                    }
                }
            }
            catch (Exception ex)
            {
                return new CommonDBResponse
                {
                    Code = "1",
                    Message = ex.Message,
                };
            }

            return new CommonDBResponse
            {
                Code = obj.Code,
                Message = obj.Message,
            };
        }


        public CommonDBResponseEncryption getEncryptionKeyByUsername(string username)  //encryptionkey with username (For login Login)
        {
            var param = new DynamicParameters();
            var key = "";
            CommonDBResponseEncryption obj = new CommonDBResponseEncryption();
            param.Add("@flag", "vu");
            param.Add("@userName", username);
            using (var connection = _context.CreateConnection())
            {
                obj = connection.QueryFirstOrDefault<CommonDBResponseEncryption>(sql: "[dbo].[apiproc_login_user]", param: param, commandType: CommandType.StoredProcedure);

                return obj;

            }

        }
        public CommonDBResponseEncryption getEncryptionKeyByToken(string username, string token)   //encryptionkey with username and token
        {
            var param = new DynamicParameters();
            var key = "";
            CommonDBResponseEncryption obj = new CommonDBResponseEncryption();
            param.Add("@flag", "vut");
            param.Add("@userName", username);
            param.Add("@token", token);
            using (var connection = _context.CreateConnection())
            {
                obj = connection.QueryFirstOrDefault<CommonDBResponseEncryption>(sql: "[dbo].[apiproc_login_user]", param: param, commandType: CommandType.StoredProcedure);

                return obj;

            }


        }

        public async Task<CommonDBResponse> GetServiceDetails(ServiceDetailCommon model, CommonAttributeRequest apirequest, string Token)
        {
            CommonDBResponse obj = new CommonDBResponse();
            var _IsApiCall = _context._IsApiCall;
            var ApiUrl = _context._ApiBearerUrl;
            try
            {
                if (_IsApiCall == "1")
                {
                    apirequest.FunctionName = ConnectFunctions.GetServiceList.ToString();
                    CommonDBResponseEncryption objkey = getEncryptionKeyByToken("9867718033", Token);//get encryption key
                    if (objkey.code != "0")
                    {
                        return new CommonDBResponse
                        {
                            Code = "1",
                            Message = objkey.message,

                        };
                    }
                    var requestdata = _Api.GetRequestData<ServiceDetailCommon>(apirequest.FunctionName, objkey.encryption_key, model);
                    var response = await _Api.HttpPostRequestApi<CommonDBResponse>(requestdata, ApiUrl, "Bearer", Token);
                    CommonDBResponse? objresponse = JsonConvert.DeserializeObject<CommonDBResponse>(JsonConvert.SerializeObject(response));
                    return new CommonDBResponse
                    {
                        Code = objresponse?.Code,
                        Message = objresponse?.Message,
                        Data = objresponse?.Data,
                    };
                }
                else
                {
                    var param = new DynamicParameters();
                    param.Add("@flag", "s");
                    param.Add("@productId", model.product_id);
                    param.Add("@userName", "9867718033");
                    using (var connection = _context.CreateConnection())
                    {

                        List<ServiceDetailresponseCommon> List = connection.Query<ServiceDetailresponseCommon>(sql: "[dbo].[apiProc_Product_detail]", param: param, commandType: CommandType.StoredProcedure).ToList();
                        return new CommonDBResponse
                        {
                            Code = "0",
                            Message = obj.Message,
                            Data = List,
                        };
                    }
                }
            }
            catch (Exception ex)
            {
                return new CommonDBResponse
                {
                    Code = "1",
                    Message = ex.Message,
                };
            }

            return new CommonDBResponse
            {
                Code = obj.Code,
                Message = obj.Message,
            };
        }

        public int Count()
        {
            return 100;
        }
    }
}
