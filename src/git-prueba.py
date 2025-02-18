import requests

TOKEN = "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"
USERNAME = "MelonConYogurt"
HEADERS = {"Authorization": f"token {TOKEN}", "Accept": "application/vnd.github.v3+json"}

events_url = f"https://api.github.com/users/{USERNAME}/events"

class Repository:
    def __init__(self, id, name, type):
        self.id = id
        self.name = name
        self.type = type        
        self.events = 1
    
    def increment_events(self):
        self.events += 1

def get_Repositorys_data():
    try:
        response = requests.get(events_url, headers=HEADERS).json()
        return response
    except Exception as e:
        print(f"Error al obtener datos: {e}")

def filter_repostories():
    try:
        events = get_Repositorys_data()
        Repositorys = []
        for event in events:
            if event['repo']['id'] in [repo.id for repo in Repositorys]:
                for repo in Repositorys:
                    if repo.id == event['repo']['id']:
                        repo.increment_events()
            else:
                Repositorys.append(Repository(id=event['repo']['id'], name=event['repo']['name'], type=event['type']))
        return Repositorys    
    except Exception as e:
        print(e)


if __name__ == '__main__':
    filter_repos =  filter_repostories()
    for repo in filter_repos:
        print(f"id:{repo.id}, name:{repo.name}, type:{repo.type}, events:{repo.events}")
