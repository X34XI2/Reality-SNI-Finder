from subprocess import check_output, CalledProcessError
from re import findall
from pandas import DataFrame
from tabulate import tabulate
from os import system

# Читаем список доменов из файла
with open("sni.txt", "r") as my_file:
    sni_list = list(filter(None, my_file.read().split("\n")))

# Списки для успешных доменов и их пингов
successful_domains = []
avg_value_list = []

for domain in sni_list:
    try:
        output = check_output(f"./tlsping {domain}:443", shell=True, stderr=None).decode('utf-8').rstrip()
        # Ищем avg значение пинга
        avg_value = findall(r"avg/.*?ms.*?(\d+\.?\d*)ms", output)
        if avg_value:
            avg_value_list.append(float(avg_value[0]))
            successful_domains.append(domain)
        else:
            print(f"[Warning] Не удалось найти avg пинг для домена: {domain}")
    except CalledProcessError:
        print(f"[Error] Не удалось подключиться к домену: {domain}")
    except Exception as e:
        print(f"[Error] Ошибка при обработке домена {domain}: {e}")

if not successful_domains:
    print("Нет успешных результатов для обработки.")
    exit(1)

# Создаем словарь домен -> пинг
domain_ping_dict = dict(zip(successful_domains, avg_value_list))

# Сортируем словарь по пингу
sorted_dict = dict(sorted(domain_ping_dict.items(), key=lambda item: item[1]))

# Выводим таблицу
df = DataFrame(sorted_dict.items(), columns=['Domain', 'Ping (ms)'])
system('clear')
print(tabulate(df, headers='keys', tablefmt='psql', showindex=False))
