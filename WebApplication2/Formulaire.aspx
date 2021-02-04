<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Formulaire.aspx.cs" Inherits="WebApplication2.Formulaire" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>'
		DeleteCommand="DELETE FROM [Personne] WHERE [Id_P] = @Id_P" 
		InsertCommand="INSERT INTO [Personne] ([Nom], [Prenom], [Date_Nai], [Adresse], [Id_Vil],sexe) VALUES (@Nom, @Prenom, @Date_Nai, @Adresse, @Id_Vil,@sexe)"
		SelectCommand="SELECT [Id_P], [sexe], [Nom], [Prenom], [Date_Nai], [Adresse], [Id_Vil] FROM [Personne]" 
		UpdateCommand="UPDATE [Personne] SET [Nom] = @Nom, [Prenom] = @Prenom, [Date_Nai] = @Date_Nai, [Adresse] = @Adresse, [Id_Vil] = @Id_Vil WHERE [Id_P] = @Id_P">
		<DeleteParameters>
			<asp:Parameter Name="Id_P" Type="Int32"></asp:Parameter>
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Nom" Type="String"></asp:Parameter>
			<asp:Parameter Name="Prenom" Type="String"></asp:Parameter>
			<asp:Parameter Name="Date_Nai" Type="DateTime"></asp:Parameter>
			<asp:Parameter Name="Adresse" Type="String"></asp:Parameter>
			<asp:Parameter Name="Id_Vil" Type="Int32"></asp:Parameter>
			<asp:Parameter Name="sexe" Type="String"></asp:Parameter>
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Nom" Type="String"></asp:Parameter>
			<asp:Parameter Name="Prenom" Type="String"></asp:Parameter>
			<asp:Parameter Name="Date_Nai" Type="DateTime"></asp:Parameter>
			<asp:Parameter Name="Adresse" Type="String"></asp:Parameter>
			<asp:Parameter Name="Id_Vil" Type="Int32"></asp:Parameter>
			<asp:Parameter Name="Id_P" Type="Int32"></asp:Parameter>
		</UpdateParameters>
	</asp:SqlDataSource>

	<asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" DataKeyNames="Id_P" DataSourceID="SqlDataSource1">
		<EditItemTemplate>
			Id_P:
			<asp:Label Text='<%# Eval("Id_P") %>' runat="server" ID="Id_PLabel1" /><br />
			Nom:
			<asp:TextBox Text='<%# Bind("Nom") %>' runat="server" ID="NomTextBox" /><br />
			Prenom:
			<asp:TextBox Text='<%# Bind("Prenom") %>' runat="server" ID="PrenomTextBox" /><br />
			Date_Nai:
			<asp:TextBox Text='<%# Bind("Date_Nai") %>' runat="server" ID="Date_NaiTextBox" /><br />
			Adresse:
			<asp:TextBox Text='<%# Bind("Adresse") %>' runat="server" ID="AdresseTextBox" /><br />
			Id_Vil:
			<asp:TextBox Text='<%# Bind("Id_Vil") %>' runat="server" ID="Id_VilTextBox" /><br />
			<asp:LinkButton runat="server" Text="Mettre à jour" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Annuler" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
		</EditItemTemplate>
		<InsertItemTemplate>
			Nom:
			<asp:TextBox Text='<%# Bind("Nom") %>' runat="server" ID="NomTextBox" /><br />
			Prenom:
			<asp:TextBox Text='<%# Bind("Prenom") %>' runat="server" ID="PrenomTextBox" /><br />
			Sexe:

			<asp:DropDownList ID="DropDownList6" AppendDataBoundItems="true" runat="server" SelectedValue='<%# Bind("sexe") %>'>
				<asp:ListItem Text="Homme" Value="Homme" />
				<asp:ListItem Text="Femme" Value="Femme" />
			</asp:DropDownList>
			Date_Nai:
			<asp:TextBox Text='<%# Bind("Date_Nai") %>' TextMode="Date" runat="server" ID="Date_NaiTextBox" /><br />
			Adresse:
			<asp:TextBox Text='<%# Bind("Adresse") %>' TextMode="MultiLine"  runat="server" ID="AdresseTextBox" /><br />
			Pays:
			<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [Id_Pay], [Nom_p] FROM [Pays]"></asp:SqlDataSource>
			<asp:DropDownList AutoPostBack="true" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nom_p" DataValueField="Id_Pay"></asp:DropDownList>
			<br/>
			Ville:
			<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [Id_Vil], [Nom_Vil], [Id_Pay] FROM [Ville] WHERE ([Id_Pay] = @Id_Pay)">
				<SelectParameters>
					<asp:ControlParameter ControlID="DropDownList4" PropertyName="SelectedValue" Name="Id_Pay" Type="Int32"></asp:ControlParameter>
				</SelectParameters>
			</asp:SqlDataSource>
			<asp:DropDownList ID="DropDownList2" AutoPostBack="true" OnPreRender="DropDownList2_PreRender"  runat="server" DataSourceID="SqlDataSource2" DataTextField="Nom_Vil" DataValueField="Id_Vil">
			</asp:DropDownList>
			<asp:HiddenField ID="HiddenField1" value='<%# Bind("Id_Vil") %>' runat="server" />
			<br />
			<asp:LinkButton runat="server" Text="Insérer" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Annuler" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
		</InsertItemTemplate>
		<ItemTemplate>
			Id_P:
			<asp:Label Text='<%# Eval("Id_P") %>' runat="server" ID="Id_PLabel" /><br />
			Nom:
			<asp:Label Text='<%# Bind("Nom") %>' runat="server" ID="NomLabel" /><br />
			Prenom:
			<asp:Label Text='<%# Bind("Prenom") %>' runat="server" ID="PrenomLabel" /><br />
			Date_Nai:
			<asp:Label Text='<%# Bind("Date_Nai") %>' runat="server" ID="Date_NaiLabel" /><br />
			Adresse:
			<asp:Label Text='<%# Bind("Adresse") %>' runat="server" ID="AdresseLabel" /><br />
			Id_Vil:
			<asp:Label Text='<%# Bind("Id_Vil") %>' runat="server" ID="Id_VilLabel" /><br />
			<asp:LinkButton runat="server" Text="Modifier" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Supprimer" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Nouveau" CommandName="New" ID="NewButton" CausesValidation="False" />
		</ItemTemplate>
	</asp:FormView>
</asp:Content>
