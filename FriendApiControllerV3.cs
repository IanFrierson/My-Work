using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Models.Domain.Friends;
using Sabio.Models.Requests.Friends;
using Sabio.Services;
using Sabio.Web.Controllers;
using Sabio.Web.Models.Responses;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Sabio.Web.Api.Controllers
{
    [Route("api/v3/friends")]
    [ApiController]
    public class FriendApiControllerV3 : BaseApiController
    {

        private IFriendService _service = null;
        private IAuthenticationService<int> _authService = null;

        public FriendApiControllerV3(IFriendService service, ILogger<PingApiController> logger
            , IAuthenticationService<int> authService) : base(logger)
        {
            _service = service;
            _authService = authService;
        }

        [HttpGet("{id:int}")]

        public ActionResult<ItemResponse<FriendV3>> GetV3(int id)
        {
            int code = 200;
            BaseResponse response = null;

            try
            {
                FriendV3 friend = _service.GetV3(id);

                if (friend == null)
                {
                    code = 404;
                    response = new ErrorResponse("Resouce not found");
                }
                else
                {
                    response = new ItemResponse<FriendV3> { Item = friend };
                }
            }
            catch (SqlException sqlEx)
            {
                code = 500;
                response = new ErrorResponse($"SqlException Error:{sqlEx.Message}");
                base.Logger.LogError(sqlEx.ToString());
            }
            catch (ArgumentException argEx)
            {
                code = 500;
                response = new ErrorResponse($"ArgumentException Errors:{argEx.Message}");

            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse($"Generic Error:{ex.Message}");
                base.Logger.LogError(ex.ToString());

                return base.StatusCode(500, new ErrorResponse($"Generic Errors:{ex.Message}"));
            }
            return StatusCode(code, response);
        }

        [HttpGet]
        public ActionResult<ItemResponse<Friend>> GetAllV3()
        {
            int code = 200;
            BaseResponse response = null;

            try
            {
                List<Friend> list = _service.GetRandomFriendsV2();

                if (list == null)
                {
                    code = 404;
                    response = new ErrorResponse("App Resource not found");
                }
                else
                {
                    response = new ItemsResponse<Friend> { Items = list };
                }
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
                base.Logger.LogError(ex.ToString());
            }
            return StatusCode(code, response);
        }

        [HttpPost]
        public ActionResult<ItemResponse<int>> CreateV3(FriendAddRequest model)
        {
            ObjectResult result = null;

            try
            {
                int userId = _authService.GetCurrentUserId();

                
                int id = 0;
                ItemResponse<int> response = new ItemResponse<int>() { Item = id };

                result = Created201(response);
            }
            catch (Exception ex)
            {
                Logger.LogError(ex.ToString());
                ErrorResponse response = new ErrorResponse(ex.Message);

                result = StatusCode(500, response);
            }

            return result;

        }

        [HttpPut("{id:int}")]
        public ActionResult<ItemResponse<int>> UpdateV3(FriendUpdateRequestV2 model, int userId)
        {
            int code = 200;
            BaseResponse response = null;//

            try
            {
                _service.UpdateV2(model, userId);

                response = new SuccessResponse();
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
            }

            return StatusCode(code, response);
        }

        [HttpDelete("{id:int}")]
        public ActionResult<SuccessResponse> DeleteV3(int id)
        {
            int code = 200;
            BaseResponse response = null;

            try
            {
                _service.DeleteV2(id);

                response = new SuccessResponse();
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
            }
            return StatusCode(code, response);
        }

        [HttpGet("paginate")]
        public ActionResult<ItemResponse<Paged<Friend>>> GetPaginateV3(int pageIndex, int pageSize)
        {
            int code = 200;
            BaseResponse response = null;//do not declare an instance.

            try
            {
                Paged<Friend> page = _service.GetPaginate(pageIndex, pageSize);

                if (page == null)
                {
                    code = 404;
                    response = new ErrorResponse("App Resource not found.");
                }
                else
                {
                    response = new ItemResponse<Paged<Friend>> { Item = page };
                }
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
                base.Logger.LogError(ex.ToString());
            }


            return StatusCode(code, response);

        }

        [HttpGet("search")]
        public ActionResult<ItemResponse<Paged<FriendV2>>> SearchPaginateV3(int pageIndex, int pageSize, string query)
        {
            int code = 200;
            BaseResponse response = null;
            try
            {
                Paged<FriendV2> paged = _service.SearchPaginateV2(pageIndex, pageSize, query);
                if (paged == null)
                {
                    code = 404;
                    response = new ErrorResponse("Records Not Found");
                }
                else
                {
                    response = new ItemResponse<Paged<FriendV2>>() { Item = paged };


                }
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
                base.Logger.LogError(ex.ToString());

            }
            return StatusCode(code, response);
        }
    }


}
