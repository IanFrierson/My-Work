
using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Models.Domain.Friends;
using Sabio.Models.Requests.Friends;
using System.Collections.Generic;
namespace Sabio.Web.Api.Controllers
{
    public interface IFriendService
    {
        List<Friend> GetRandomFriends();
        int Add(FriendAddRequest model, int userId);
        void Delete(int id);
        Friend Get(int id);

        void Update(FriendUpdateRequest model, int userId);
        Paged<Friend> GetPaginate(int pageIndex, int pageSize);
        Paged<Friend> SearchPaginate(int pageIndex, int pageSize, string query);

        List<Friend> GetRandomFriendsV2();
        int AddV2(FriendAddRequestV2 model, int userId);
        void DeleteV2(int id);
        FriendV2 GetV2(int id);
        FriendV3 GetV3(int id);

        void UpdateV2(FriendUpdateRequestV2 model, int userId);
     
        Paged<FriendV2> SearchPaginateV2(int pageIndex, int pageSize, string query);
    }
}