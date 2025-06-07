using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Borrows_MemberSelector : System.Web.UI.UserControl
{
    protected int PageSize = 15;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            CurrentPageLabel.Text = "1";
            LoadMember();
            LoadMaxPageCount();
        }
    }

    protected void PrivPage_Click(object sender, EventArgs e)
    {
        var mum = (int.Parse(CurrentPageLabel.Text) - 1);
        if (mum > 1)
        {
            CurrentPageLabel.Text = mum.ToString();
            LoadMember();
        }
    }

    protected void NextPage_Click(object sender, EventArgs e)
    {
        var max = int.Parse(MaxPage.Text);
        var curr = int.Parse(CurrentPageLabel.Text);

        if (curr < max)
        {
            CurrentPageLabel.Text = (int.Parse(CurrentPageLabel.Text) + 1).ToString();
            LoadMember();
        }
    }
    protected List<Member> GetMembers(string q, int pageIndex, int pageSize)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var builder = new SqlBuilder();
            var template = builder.AddTemplate(@"
                SELECT m.*
                FROM Members m
                /**where**/
                ORDER BY m.CreatedAt DESC
                OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY", new { Offset = pageIndex * pageSize, PageSize = pageSize });

            if (q.Trim().Length > 0)
            {
                builder.Where("m.DeletedAt IS NULL AND (m.FullName COLLATE Latin1_General_CI_AI LIKE @Keyword OR m.Email COLLATE Latin1_General_CI_AI LIKE @Keyword OR m.Phone LIKE @Keyword)", new { Keyword = $"%{q}%" });
            }
            else
            {
                builder.Where("m.DeletedAt IS NULL");
            }

            return conn.Query<Member>(template.RawSql, template.Parameters).ToList();
        }
    }

    protected int GetMemberCount(string q)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var builder = new SqlBuilder();

            var template = builder.AddTemplate(@"
                SELECT COUNT(*)
                FROM Members m
                /**where**/");

            if (q.Trim().Length > 0)
            {
                builder.Where("(m.FullName COLLATE Latin1_General_CI_AI LIKE @Keyword OR m.Email COLLATE Latin1_General_CI_AI LIKE @Keyword OR m.Phone LIKE @Keyword) AND m.DeletedAt IS NULL", new { Keyword = $"%{q}%" });
            }
            else
            {
                builder.Where("m.DeletedAt IS NULL");
            }

            return conn.QueryFirstOrDefault<int>(template.RawSql, template.Parameters);
        }
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        CurrentSearchValue.Text = SearchTextBox.Text;
        CurrentPageLabel.Text = "1";

        LoadMaxPageCount();
        LoadMember();
    }

    protected void LoadMaxPageCount()
    {
        MaxPage.Text = Math.Ceiling((double)GetMemberCount(CurrentSearchValue.Text) / PageSize).ToString();
    }

    private void LoadMember()
    {
        var currPage = int.Parse(CurrentPageLabel.Text);
        var q = CurrentSearchValue.Text;

        var member = GetMembers(q, currPage-1, PageSize);

        MemberRepeater.DataSource = member;
        MemberRepeater.DataBind();
    }

    protected void SearchTextBox_TextChanged(object sender, EventArgs e)
    {
        SearchTextBox.Attributes.Add("x-init", "$el.focus(); $el.setSelectionRange($el.value.length, $el.value.length);");

        CurrentSearchValue.Text = SearchTextBox.Text;
        CurrentPageLabel.Text = "1";

        LoadMaxPageCount();
        LoadMember();
    }
}