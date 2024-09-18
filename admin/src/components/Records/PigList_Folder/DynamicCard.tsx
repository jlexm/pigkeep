import * as React from 'react';
import { Card, Grid2, Typography } from '@mui/material';

// Define the props type for the data
interface CardData {
  number: number;
  text: string;
}

interface DynamicCardsProps {
  data: CardData[];
  onCardClick: (category: string) => void;
}

const DynamicCards: React.FC<DynamicCardsProps> = ({ data, onCardClick }) => {
  return (
    <Grid2 container spacing={1.4} justifyContent="start" className='card'>
      {data.map((item, index) => (
        <Grid2 key={index}>
          <Card
            variant="outlined"
            onClick={() => onCardClick(item.text)}
            sx={{
              textAlign: 'center',
              minWidth: '98px',
              minHeight: '100px',
              borderRadius: '10px',
              borderColor: '#000',
              borderWidth: '1px',
              alignContent: 'center',
              alignSelf: 'start',
              cursor: 'pointer'
            }}
          >
            <Typography variant="h4" component="div" fontWeight="bold">
              {item.number}
            </Typography>
            <Typography variant="body1" component="div">
              {item.text}
            </Typography>
          </Card>
        </Grid2>
      ))}
    </Grid2>
  );
};

export default function Cards() {
  const [, setSortCategory] = React.useState<string | null>(null);

  const cardData: CardData[] = [
    { number: 11, text: 'Sows' },
    { number: 14, text: 'Weaners' },
    { number: 10, text: 'Piglets' },
    { number: 4, text: 'Boars' },
    { number: 2, text: 'Growers' },
    { number: 1, text: 'Matured' },
  ];

  return (
    <DynamicCards 
      data={cardData} 
      onCardClick={(category) => setSortCategory(category)}
    />
  );
}
