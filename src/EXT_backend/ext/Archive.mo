/**

//TODO need a way to retreive the correct transfer request if it has been overwritten

 */
import ExtCore "./Core";
import Result "mo:base/Result";


module ExtArchive = {
  
  public type Date = Nat64;
  public type TransactionId = Nat;
  public type Transaction = {
    txid : TransactionId;
    request : ExtCore.TransferRequest;
    date : Date;
  };

  public type TransactionRequest = {
    Quey : {
      #txid : TransactionId;
      #user : ExtCore.User;
      #date : (Date, Date); //from - to
      #page : (Nat, Nat); // all per page - page
      #all;
    };
    token : ExtCore.TokenIdentifier;
  };
  
  public type ValidActor = actor {
  add : shared (request : ExtCore.TransferRequest) -> async TransactionId;
  transactions : query (request : TransactionRequest) -> async Result.Result<[Transaction], ExtCore.CommonError>;
  };
};