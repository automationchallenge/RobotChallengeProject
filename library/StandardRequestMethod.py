import requests


class StandardRequestMethod(object):

    def getrequestservice(self, url, authtoken):
        print(url)
        token = 'Bearer ' + authtoken
        header = {
            "content-type": "application/json",
            "Authorization": token
        }
        responseoutput = requests.request("GET", url, headers=header)
        return responseoutput

    def getrequestservicewithaccepttext(self, url, authtoken):
        print(url)

        token = 'Bearer ' + authtoken
        header = {
            "content-type": "application/json",
            "Authorization": token
        }
        responseoutput = requests.request("GET", url, headers=header)
        return responseoutput

    def getrequestservicewithqueryparam(self, url, paramjson, authtoken):
        token = 'Bearer ' + authtoken
        header = {
            "content-type": "application/json",
            "Authorization": token
        }
        responseoutput = requests.request("GET", url, headers=header, params=paramjson)
        return responseoutput

    def postrequestservice(self, url, body, authtoken):
        print(url)
        token = 'Bearer ' + authtoken
        header = {
            "content-type": "application/json",
            "Authorization": token
        }
        responseoutput = requests.request("POST", url, headers=header, data=body)
        return responseoutput

    def putrequestservice(self, url, body, authtoken):
        print(url)
        token = 'Bearer ' + authtoken
        header = {
            "content-type": "application/json",
            "Authorization": token
        }
        responseoutput = requests.request("PUT", url, headers=header, data=body)
        return responseoutput

    def deleterequestservice(self, url, authtoken):
        print(url)
        token = 'Bearer ' + authtoken
        header = {
            "content-type": "application/json",
            "Authorization": token
        }
        responseoutput = requests.request("DELETE", url, headers=header)
        return responseoutput

    def putrequestservicewithoutbody(self, url, authtoken):
        token = 'Bearer ' + authtoken
        header = {
            "content-type": "application/json",
            "Authorization": token
        }
        responseoutput = requests.request("PUT", url, headers=header)
        return responseoutput

    def postloginrequestservice(self, url, body):
        header = {
            "content-type": "application/json"
        }
        print(body)
        responseoutput = requests.request("POST", url, headers=header, data=body)
        return responseoutput
