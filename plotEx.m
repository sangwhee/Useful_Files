function plotEx(x_value, y_value1)
%% Input 


%% plot config
figure1 = figure;
     % 각종 축 설정
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',12,...
    'FontName','Times New Roman');
    % 그래프를 깔끔한 박스 안에 넣어 줌
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');
%plot(x_value,y_value1,'k','linewidth',2,'marker','o','markersize',10)
%plot(x_value,y_value2,'k','linewidth',2,'marker','d','markersize',10)
plot(x_value,y_value1,'k','linewidth',2)
%plot(x_value,y_value1,'--','linewidth',2)  

    %% 축의 이름, 굵기, 범위 설정
%xlabel('omega \omega','fontsize',12,'fontweight','bold','fontname','Times New Roman')
%ylabel('gamma \gamma','fontsize',12,'fontweight','bold','fontname','Times New Roman')
xlabel('\omega_{rm} [rpm]','fontsize',12,'fontweight','bold','fontname','Times New Roman')

ylabel('T_{e} [Nm]','fontsize',12,'fontweight','bold','fontname','Times New Roman')

xlabel('$O_2$: Torque Ripple [\%]', 'Interpreter','latex','FontSize',8,...
            'FontName','TimesNewRoman');
ylabel('$\dot{\theta}$','Interpreter','latex','fontsize',12,'fontweight','bold',...
    'fontname','Times New Roman')
set(gca,'FontSize',12)
% 이유는 알기 어려운데 'TimesNewRoman'으로하면 아래 코드가 동작하지 않는다.
% 그냥 'Times New Roman'을 사용할것. 아마 'TimesNewRoman' 은 
% Latex에서 사용되는 것 같다.
set(gca,'FontSize',12,'FontName','Times New Roman')
title('Damping Term \sigma - \alpha','FontWeight','bold','FontSize',12,...
    'FontName','Times New Roman');

figure1 = figure;
% axes 생성
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(alpha,Damping,'linewidth',2)
% ylabel 생성
ylabel('Damping Term \sigma','FontWeight','bold',...
    'FontName','Times New Roman');
% xlabel 생성
xlabel('\alpha','FontWeight','bold','FontName','Times New Roman');
% title 생성
% frequency{k} 는 다이나믹하게 변하는 string
title(['V_{LL,rms} & I_{rms}', frequency{k},' Hz, 4 kHz'],'FontWeight','bold',...
    'FontName','Times New Roman');
box(axes1,'on');
grid(axes1,'on');
grid minor;
% 나머지 axes 속성 설정
set(axes1,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');

xlim([0 14000])
ylim([0 300])


%% Ratio of plot
pbaspect([1 1 1]); % x y z axis ratio
    %% 범례 설정
%legend('case1','case2')
% legend('\tau_e - \omega_{rm} Curve')
% legend1 = legend(axes1,'show');
% set(legend1,'Location','NorthEast');

% legendHandle = legend('Arnon 5','Arnon 7');
% set(legendHandle,'FontSize',10);
% set(legendHandle,'FontName','Times New Roman');


%% Figure에서 내가 편집한걸 알고 싶으면 figure 편집을 마치고 'file-코드 생성' 로 가면 됨

Vfft = fft(Vsample);
Vfft = abs(Vfft);
N = length(Vfft);
frequencyRange = (0:N-1)*fsample/N;
L = length(frequencyRange);
L=floor(L/2);
frequencyRangeHalf = frequencyRange(1:L);
VfftHalf = Vfft(1:floor( length(Vfft)/2 ) );
plot( frequencyRangeHalf,  (VfftHalf/(N/2))/2  );

%% Stacked bar graph
bar(a, 'stacked')

%% Partial Legend
% first method
f=get(gca,'Children');
legend([f(2),f(6)],'second graph','sixth graph')

% second method
% https://www.mathworks.com/matlabcentral/answers/129574-how-do-i-select-data-to-legend-in-a-plot
 data1 = 10*ones(10,4)+randn(10,4);
 t1    = (0:1:9);
 figure();
 p1 = plot(t1,data1,'bo');
 hold on
 data2 = 25*ones(100,4)+2*randn(100,4);
 t2    = (0:0.1:9.9);
 p2 = plot(t2,data2,'rx');
 legend([p1(1),p2(1)],'From data1','From data2');

%% 종합
clf             % clear figure 이라는 말. 특히 hold on/off를 많이 쓰는 경우 hold on 이전에 clf를 넣어서 figure를 한번씩 클리어해주면 좋다.
subplot(2,1,2)

t = tiledlayout(1,1,'TileSpacing','compact','Padding','compact'); % nathan이 추천한 subplot의 alternative
nexttile; plot(x,carrier);

semilogx(TW.CM.f, TW.CM.ph)
plot(x1,y1,'linewidth', 2, x2,y2, '--', 'linewidth',2, x3,y3) % 이건 동작 안함
get(gca,'colororder')
         0    0.4470    0.7410
    0.8500    0.3250    0.0980
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
    0.4660    0.6740    0.1880
    0.3010    0.7450    0.9330
    0.6350    0.0780    0.1840

blue = [55, 126, 184]/255;
red = [228, 26, 28]/255;
yellow = [0.9290    0.6940    0.1250];
orange = [251, 140, 0]/255;
darkGreen = [0, 105, 92]/255;
darkBlue = [0,0,128]/255;
lightGreen = [104, 159, 56]/255;
lightOrange = [255, 204, 128]/255;
lightBlue = [94 191 255]/255;
lightYellow = [246, 216, 143]/255;
lightRed = [241, 167, 135]/255;
magenta = [210,0,105]/255;
    
plot(x1,y1, 'g--', x2, y2, 'r', x1,y3,'b', 'linewidth', 2, 'Color',[r g b]), grid on, hold on  
plot(xx, fctn(xx), 'b', [-1 3.5], [0 0], 'k:', [0 0], [-4 8],  'k:') % matlab fig에서 점선을 만드는 기똥찬 방법 ㅋㅋ

xlabel('frequency [Hz]', 'Interpreter','latex')
ylabel('$|\phi_{CM}|$ [degree]','Interpreter', 'latex')

set(gca,'XTickLabel',{'150 kHz','1 MHz','10 MHz','30 MHz'}) % xlabel에서 내가 원하는 스케일로 
set(gca,'XTick',[150e3,1e6,1e7, 3e7])                       % 스케일을 넣고 싶을때 사용하는 코드

xticks(-200:50:100)                                         % 또 다른 방법
xticklabels({'-200','-150','-100','-50','0','50','100'})

axis([xmin,xmax,ymin,ymax])

%% Changing color codes
c = lines; % This will give you the whole array of RGB values

% normally RGBs are given with 0~255 value. To get this value, simply
% multiply c with 255;
c255 = c*255;

% use the following website to get the lightened color's RGB value
% https://mdigi.tools/lighten-color/#294577

%% put text on the plot
text1 = text (pi, 100,  '\bfq');
text2 = text (pi/2, -200,  'q');
set(text2,'FontName','Times New Roman','FontSize',12,'Interpreter','latex');
set(text2,'FontName','Times New Roman','FontSize',12,'Interpreter','latex');

legend('\xi = 0 (x_{op}=0.001 mm)', '\xi = 0.5 (x_{op}=0.0.033331 mm)', '\xi = 1 (x_{op} = 0.0333328 mm)', '\xi = 1.5 (x_{op} = 0.0333332 mm)')
legend1 = legend('$\hat{R_{p}} = R_{p}$','$\hat{R_{p}} = 1.2 R_{p}$','$\hat{R_{p}} = 0.8 R_{p}$');
set(legend1,'Interpreter','latex')
set(gca,'FontName','Times New Roman','FontSize',12, 'FontWeight','bold');
%% Positioning 

set(gcf,'units','centimeters','position',[x0,y0,width,height])
% 'centimeters' 대신에 'inches' 'centimeters' normalized' 'points' 'charaters' 모두 가능

%% tiledlayout
fig1 = figure(1); tiledlayout(1,1,'Padding','tight'); nexttile(1);