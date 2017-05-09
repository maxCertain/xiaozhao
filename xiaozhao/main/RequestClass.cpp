//
//  RequestClass.cpp
//  xiaozhao
//
//  Created by liicon on 2017/4/27.
//  Copyright © 2017年 max. All rights reserved.
//

#include "RequestClass.hpp"
#include <string>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

bool GetIpByDomainName(char *szHost, char* szIp)
{
//    WSADATA        wsaData;
    
    hostent   *pHostEnt;
    int             nAdapter = 0;
    struct       sockaddr_in   sAddr;
//    if (WSAStartup(0x0101, &wsaData))
//    {
//        printf(" gethostbyname error for host:\n");
//        return false;
//    }
    
    pHostEnt = gethostbyname(szHost);
    if (pHostEnt)
    {
        if (pHostEnt->h_addr_list[nAdapter])
        {
            memcpy(&sAddr.sin_addr.s_addr, pHostEnt->h_addr_list[nAdapter], pHostEnt->h_length);
            sprintf(szIp, "%s", inet_ntoa(sAddr.sin_addr));
        }
    }
    else
    {
        //      DWORD  dwError = GetLastError();
        //      CString  csError;
        //      csError.Format("%d", dwError);
    }
    
    return true;
}


char *POSTHead(char host,char param){
    
    char *bufSend = "Connection:Keep-Alive\r\n"
                    "Accept-Encoding:gzip,deflate\r\n"
                    "Accept-Language:zh-CN,en,*\r\n"
                    "host:"
    ;
    return bufSend;
}


void MyRequestClass::sendGetRequest()
{
    //开始进行socket初始化;
    
    int clientSocket = socket(AF_INET, 1, 0);
    
    char *bufSend = "Get /test/task/custom?+name=xiaoming HTTP/1.1\r\n"
    "Connection:Keep-Alive\r\n"
    "Accept-Encoding:gzip, deflate\r\n"
    "Accept-Language:zh-CN,en,*\r\n"
    "host:127.0.0.1:8080\r\n"
    "User-Agent:Mozilla/5.0\r\n\r\n";
    
    char addIp[256] = "127.0.0.1:8080";
    
    struct sockaddr_in ServerAddr = {0};;
    
    ServerAddr.sin_addr.s_addr = inet_addr(addIp);
    ServerAddr.sin_port = htons(8080);;
    ServerAddr.sin_family = AF_INET;
    char bufRecv[3069] = {0};
    int errNo = 0;
    
    GetIpByDomainName("127.0.0.1:8080" , addIp);
    
    errNo = connect(clientSocket, (sockaddr*)&ServerAddr, sizeof(ServerAddr));
    if(errNo==0)
    {
        //如果发送成功，则返回发送成功的字节数;
        if(send(clientSocket,bufSend ,strlen(bufSend),0)>0)
        {
            std::cout<<"发送成功\n";;
        }
        //如果接受成功，则返回接受的字节数;
        if(recv(clientSocket,bufRecv,3069,0)>0)
        {
            std::cout<<"接受的数据:"<<bufRecv<<std::endl;
        }
    }
    
    std::cout<< bufSend << std::endl;
  
}
