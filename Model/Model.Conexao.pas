unit Model.Conexao;

interface

uses
  Firedac.Comp.Client,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Core.Session,
  Spring.Persistence.Core.ConnectionFactory,
  Spring.Persistence.Adapters.Firedac,
  Firedac.Stan.Intf,
  Firedac.Stan.Option,
  Firedac.Stan.Error,
  Firedac.UI.Intf,
  Firedac.Phys.Intf,
  Firedac.Stan.Def,
  Firedac.Stan.Pool,
  Firedac.Stan.Async,
  Firedac.Phys,
  Firedac.Phys.FB,
  Firedac.Phys.FBDef,
  Firedac.Stan.ExprFuncs,
  Firedac.Phys.IBWrapper,
  Firedac.VCLUI.Wait,
  Data.DB;

type
  TConnection = class
  public
    class function NewSession: TSession;
  end;

implementation

{ TConnection }

class function TConnection.NewSession: TSession;
var
  FDConnection: TFDCOnnection;
  Connection: IDBConnection;
begin
  FDConnection := TFDCOnnection.Create(nil);
  FDConnection.Params.Clear;
  FDConnection.Params.Add('DriverID=FB');
  FDConnection.Params.Add('Server=127.0.0.1');
  FDConnection.Params.Add('Database=C:\FONTES\Colaborar\DataBase\BANCOCOLABORAR.FDB');
  FDConnection.Params.Add('Protocol=TCPIP');
  FDConnection.Params.Add('User_Name=SYSDBA');
  FDConnection.Params.Add('Password=masterkey');
  FDConnection.Params.Add('Port=3050');

  Connection := TConnectionFactory.GetInstance(dtFireDaC, FDConnection);
  Connection.AutoFreeConnection := True;

  Result := TSession.Create(Connection);
end;

end.
