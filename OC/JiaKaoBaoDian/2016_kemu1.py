import urllib.request
import pymongo
from bs4 import BeautifulSoup

jiakao_db = pymongo.MongoClient('127.0.0.1:27017').jiakao


class JiakaoBaodian:
    def __init__(self, url):
        self.url = url
        self.soup = None

    def get_soup(self):
        with urllib.request.urlopen(self.url) as f:
            self.soup = BeautifulSoup(f.read(), 'html.parser')
        return self.soup

    def get_questions(self):
        if not self.soup:
            self.get_soup()
        for index, item in enumerate(self.soup.find_all('li')):
            if index < 40:
                print(item.div)
                jiakao_doc = dict(no=index + 1, title=item.div.get_text(), type=1, img='', options=['对', '错'],
                                  answer=item.span.em.b.get_text(), analysis='')
                jiakao_db.jiakao.insert(jiakao_doc)
            else:
                print(item.div.get_text().index('A'))
                text = item.div.get_text()
                index_a = text.index('A')
                index_b = text.index('B')
                index_c = text.index('C')
                index_d = text.index('D')
                jiakao_doc = dict(no=index + 1, title=item.div.get_text()[:index_a], type=1, img='',
                                  options=[text[index_a:index_b], text[index_b:index_c], text[index_c:index_d],
                                           text[index_d:]], answer=item.span.em.b.get_text(), analysis='')
                jiakao_db.jiakao.insert(jiakao_doc)

if __name__ == '__main__':
    jiakao = JiakaoBaodian('http://www.jkydt.com/jsyllks/07dd4c1f.htm')
    jiakao.get_questions()
